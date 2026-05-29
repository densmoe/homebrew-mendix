cask "mendix-studio-pro@10.18.13" do
  version "10.18.13.89970"
  sha256 "ec83f863ed1cc575db0e4cfe05c2b338d743e8cd7eeaaa120f59afed3ff11fa4"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.13.89970-Beta.app"
end
