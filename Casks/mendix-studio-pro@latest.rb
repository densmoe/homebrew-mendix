cask "mendix-studio-pro@latest" do
  version "11.9.1"
  sha256 "d7861f418e60d1f89a72e5b6c3e6d0fcabea08a116b3ea5318087437a03c8c73"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.9.1 Beta.app"
end
