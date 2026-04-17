cask "mendix-studio-pro@10.12.7" do
  version "10.12.7.48127"
  sha256 "b8afe51777c27d4240abdf51913cf37147f824ab64b3275b51f9b455279b0402"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.7.48127-Beta.app"
end
