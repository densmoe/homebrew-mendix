cask "mendix-studio-pro@10.24.8" do
  version "10.24.8.80126"
  sha256 "29d8a050a7cc3a3adcd3cd5a792b37e45dc577012f8dc521d57054c4a913b951"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.8.80126-Beta.app"
end
