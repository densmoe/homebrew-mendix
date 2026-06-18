cask "mendix-studio-pro@11.6.7" do
  version "11.6.7"
  sha256 "cd551bb43e570cb958fa7891fefb1d75c27c708d1f31404e2352701a2a437d5e"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.7 Beta.app"
end
