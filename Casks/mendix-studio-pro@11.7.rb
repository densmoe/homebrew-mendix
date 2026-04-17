cask "mendix-studio-pro@11.7" do
  version "11.7.0"
  sha256 "3a329080d52f467ba7917a85fc9ff2d9e7ab71cb25d3d8eb196f924229ffcfa3"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.7.0 Beta.app"
end
