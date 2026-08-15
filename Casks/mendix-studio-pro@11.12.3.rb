cask "mendix-studio-pro@11.12.3" do
  version "11.12.3"
  sha256 "da1168a6b7ffa5443a689ab828b67ab9f015569cd868819c701d6c5d3c61b133"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.12.3 Beta.app"
end
