cask "mendix-studio-pro@10.13.0" do
  version "10.13.0.41393"
  sha256 "5c45750ee9b272ba79f38046dc93841f322a7b1a8d3266d075e6a930432a1980"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.13.0.41393-Beta.app"
end
