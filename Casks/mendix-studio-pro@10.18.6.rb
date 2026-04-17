cask "mendix-studio-pro@10.18.6" do
  version "10.18.6.67209"
  sha256 "45f096d3a2d2cdf305773e9e7c13d3691f1807fb84e97fdb774a4cb630e11158"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.6.67209-Beta.app"
end
