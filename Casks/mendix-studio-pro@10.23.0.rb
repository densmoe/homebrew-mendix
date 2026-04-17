cask "mendix-studio-pro@10.23.0" do
  version "10.23.0.70273"
  sha256 "c3040b11007642e87caab3c36a62beea0ac4ed3ac0dff295e2eeb87b8f533096"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.23.0.70273-Beta.app"
end
