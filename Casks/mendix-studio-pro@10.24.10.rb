cask "mendix-studio-pro@10.24.10" do
  version "10.24.10.83478"
  sha256 "94be9c387483a7c93df6e101d31cecdf39d3eb069c91c25d59044ced3a221b0e"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.10.83478-Beta.app"
end
