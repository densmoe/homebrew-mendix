cask "mendix-studio-pro@10.9.0" do
  version "10.9.0.31759"
  sha256 "314bd54b46e16038de43347012617bd324227d6db965c39dbc4df02d60f5fd54"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.9.0.31759-Beta.app"
end
