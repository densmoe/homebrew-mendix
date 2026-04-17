cask "mendix-studio-pro@10.12.11" do
  version "10.12.11.55218"
  sha256 "34a2926d72af629b56694d476d94296b5b83bdb47e982e13f131cbaa18fa16ac"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.11.55218-Beta.app"
end
