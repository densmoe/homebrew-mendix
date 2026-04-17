package main

import (
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/http/cookiejar"
	"strconv"
	"strings"
	"time"

	"github.com/google/uuid"
)

const marketplaceURL = "https://marketplace.mendix.com/xas/"

type Release struct {
	Version     string
	VersionFull string
	VersionType string
	ReleaseDate time.Time
	IsStable    bool
	Major       int
	Minor       int
	Patch       int
	Build       int
}

type xasRequest struct {
	Action string      `json:"action"`
	Params interface{} `json:"params"`
}

type sessionParams struct {
	Profile        string `json:"profile"`
	TimezoneOffset int    `json:"timezoneoffset"`
}

type sessionResponse struct {
	CsrfToken string `json:"csrftoken"`
}

type xpathParams struct {
	XPath      string      `json:"xpath"`
	Schema     xpathSchema `json:"schema"`
	Count      bool        `json:"count"`
	Aggregates bool        `json:"aggregates"`
}

type xpathSchema struct {
	Amount int         `json:"amount"`
	Offset int         `json:"offset"`
	Sort   [][2]string `json:"sort"`
}

type xpathResponse struct {
	Objects      []frameworkObject `json:"objects"`
	Count        int               `json:"count"`
	HasMoreItems bool              `json:"hasMoreItems"`
}

type frameworkObject struct {
	ObjectType string                        `json:"objectType"`
	GUID       string                        `json:"guid"`
	Attributes map[string]frameworkAttribute `json:"attributes"`
}

type frameworkAttribute struct {
	Value json.RawMessage `json:"value"`
}

func (a frameworkAttribute) String() string {
	var s string
	if err := json.Unmarshal(a.Value, &s); err != nil {
		return strings.Trim(string(a.Value), `"`)
	}
	return s
}

func (a frameworkAttribute) Int64() int64 {
	var n int64
	if err := json.Unmarshal(a.Value, &n); err != nil {
		return 0
	}
	return n
}

type MarketplaceClient struct {
	httpClient *http.Client
	csrfToken  string
}

func NewMarketplaceClient() (*MarketplaceClient, error) {
	jar, err := cookiejar.New(nil)
	if err != nil {
		return nil, err
	}
	return &MarketplaceClient{
		httpClient: &http.Client{
			Timeout: 30 * time.Second,
			Jar:     jar,
		},
	}, nil
}

func (c *MarketplaceClient) doRequest(ctx context.Context, body interface{}) ([]byte, error) {
	data, err := json.Marshal(body)
	if err != nil {
		return nil, err
	}

	req, err := http.NewRequestWithContext(ctx, "POST", marketplaceURL, bytes.NewReader(data))
	if err != nil {
		return nil, err
	}

	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("X-Mx-ReqToken", uuid.NewString())
	req.Header.Set("Cookie", "DeviceType=Desktop; Profile=Responsive")
	if c.csrfToken != "" {
		req.Header.Set("X-Csrf-Token", c.csrfToken)
	}

	resp, err := c.httpClient.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("marketplace API returned %d", resp.StatusCode)
	}

	return io.ReadAll(resp.Body)
}

func (c *MarketplaceClient) getSession(ctx context.Context) error {
	body := xasRequest{
		Action: "get_session_data",
		Params: sessionParams{
			Profile:        "",
			TimezoneOffset: -60,
		},
	}

	data, err := c.doRequest(ctx, body)
	if err != nil {
		return fmt.Errorf("get session: %w", err)
	}

	var resp sessionResponse
	if err := json.Unmarshal(data, &resp); err != nil {
		return fmt.Errorf("parse session response: %w", err)
	}

	c.csrfToken = resp.CsrfToken
	return nil
}

func (c *MarketplaceClient) FetchVersions(ctx context.Context, versionTypes []string) ([]Release, error) {
	if err := c.getSession(ctx); err != nil {
		return nil, err
	}

	typeFilter := make(map[string]bool)
	for _, t := range versionTypes {
		typeFilter[t] = true
	}

	var releases []Release
	offset := 0
	pageSize := 50

	for {
		body := xasRequest{
			Action: "retrieve_by_xpath",
			Params: xpathParams{
				XPath: "//AppStore.Framework",
				Schema: xpathSchema{
					Amount: pageSize,
					Offset: offset,
					Sort: [][2]string{
						{"Major", "desc"},
						{"Minor", "desc"},
						{"Patch", "desc"},
						{"Build", "desc"},
					},
				},
				Count:      true,
				Aggregates: false,
			},
		}

		data, err := c.doRequest(ctx, body)
		if err != nil {
			return nil, fmt.Errorf("fetch versions (offset %d): %w", offset, err)
		}

		var resp xpathResponse
		if err := json.Unmarshal(data, &resp); err != nil {
			return nil, fmt.Errorf("parse versions response: %w", err)
		}

		for _, obj := range resp.Objects {
			release := parseFramework(obj)
			if release == nil {
				continue
			}

			if len(typeFilter) > 0 && !typeFilter[release.VersionType] {
				continue
			}

			releases = append(releases, *release)
		}

		if !resp.HasMoreItems {
			break
		}
		offset += pageSize
	}

	return releases, nil
}

func parseFramework(obj frameworkObject) *Release {
	attrs := obj.Attributes

	versionText := attrs["VersionText"].String()
	versionFull := attrs["Version"].String()
	versionType := attrs["VersionType"].String()
	status := attrs["Status"].String()
	releaseDateMs := attrs["ReleaseDate"].Int64()

	if status == "Deprecated" {
		return nil
	}

	// Clean version text: strip build info like "8.4.0 (build 63076)"
	version := versionText
	if idx := strings.Index(version, " "); idx != -1 {
		version = version[:idx]
	}

	parts := parseVersionParts(version)
	if len(parts) < 3 {
		return nil
	}

	isStable := versionType == "Stable" || versionType == "MTS" || versionType == "LTS"

	shortVersion := fmt.Sprintf("%d.%d.%d", parts[0], parts[1], parts[2])

	r := &Release{
		Version:     shortVersion,
		VersionFull: versionFull,
		VersionType: versionType,
		IsStable:    isStable,
		Major:       parts[0],
		Minor:       parts[1],
		Patch:       parts[2],
	}

	if len(parts) > 3 {
		r.Build = parts[3]
	}

	if releaseDateMs > 0 {
		r.ReleaseDate = time.UnixMilli(releaseDateMs)
	}

	return r
}

func parseVersionParts(version string) []int {
	segments := strings.Split(version, ".")
	var parts []int
	for _, s := range segments {
		n, err := strconv.Atoi(s)
		if err != nil {
			break
		}
		parts = append(parts, n)
	}
	return parts
}
