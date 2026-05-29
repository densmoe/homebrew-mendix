cask "mendix-studio-pro@10.24.13" do
  version "10.24.13.86719"
  sha256 "33ca88d9b523e14a4e87404d40bc4575ab2ae0f8d437cf865869a3ccd3e2e9c9"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.13.86719-Beta.app"
end
