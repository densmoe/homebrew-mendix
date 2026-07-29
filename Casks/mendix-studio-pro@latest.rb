cask "mendix-studio-pro@latest" do
  version "11.13.0"
  sha256 "6f2dfa5c67bf646ea4740c5ea335c842931343b8a38e4cb21f713a4d40886c1f"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.13.0 Beta.app"
end
