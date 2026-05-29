cask "mendix-studio-pro@10.15" do
  version "10.15.0.46408"
  sha256 "3ffddc2bb723c01d766870b82d7c8b7bb0e298eb1cc70eeb29d1d538ca07d966"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.15.0.46408-Beta.app"
end
