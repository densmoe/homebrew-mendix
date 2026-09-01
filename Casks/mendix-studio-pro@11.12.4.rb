cask "mendix-studio-pro@11.12.4" do
  version "11.12.4"
  sha256 "87ccde568aaff6d22fc3664c47b222dcf8ae9b5b3b229079123e1a78dd58e0da"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.12.4 Beta.app"
end
