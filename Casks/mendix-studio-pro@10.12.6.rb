cask "mendix-studio-pro@10.12.6" do
  version "10.12.6.46815"
  sha256 "1038883732cd6ad5f63ada27739304ab952ee6af5e046937dc3634f1bbe7c923"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.6.46815-Beta.app"
end
