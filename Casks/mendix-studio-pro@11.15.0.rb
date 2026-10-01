cask "mendix-studio-pro@11.15.0" do
  version "11.15.0"
  sha256 "60fa53e954c82424f2da0928705ad28afc217f8e1b1bb6abaa12e2b4df42a75d"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.15.0 Beta.app"
end
