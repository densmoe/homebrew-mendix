cask "mendix-studio-pro@11.6.2" do
  version "11.6.2"
  sha256 "69669249c7abaed61277059ce0ba006e27c3a2d7d82e171a65aa19ad006f5c4c"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.2 Beta.app"
end
