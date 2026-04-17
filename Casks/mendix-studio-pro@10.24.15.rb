cask "mendix-studio-pro@10.24.15" do
  version "10.24.15.93102"
  sha256 "1095d8ebc30f76555c108bd46c019ee66df95ac29c76eb3b1c6413d979046fa9"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.15.93102-Beta.app"
end
