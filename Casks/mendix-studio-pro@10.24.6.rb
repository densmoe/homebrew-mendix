cask "mendix-studio-pro@10.24.6" do
  version "10.24.6.78836"
  sha256 "109eb89156ac960253d4fea33a65d3db2be5941b36b4589c1e11c0bdca971d98"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.6.78836-Beta.app"
end
