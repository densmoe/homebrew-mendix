cask "mendix-studio-pro@11.6.8" do
  version "11.6.8"
  sha256 "416968ca688975f3fb1a4f2e8f8fe9b4e7b57a3e944ad0c2eb7190de99ded9a0"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.8 Beta.app"
end
