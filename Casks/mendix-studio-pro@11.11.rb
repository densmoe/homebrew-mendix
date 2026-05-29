cask "mendix-studio-pro@11.11" do
  version "11.11.0"
  sha256 "937d7f6612091d0f3ac1c63f655cac22eb9626c5b1baf42f9cb2762a48dbf248"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.11.0 Beta.app"
end
