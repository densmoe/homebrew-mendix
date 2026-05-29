cask "mendix-studio-pro@11.6.4" do
  version "11.6.4"
  sha256 "fd419face52dc2817d23756bafd8ce04ff09d1bfcaf2fc9d4b1c4eaf6edf0d98"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.4 Beta.app"
end
