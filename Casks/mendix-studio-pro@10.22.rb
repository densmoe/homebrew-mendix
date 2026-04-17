cask "mendix-studio-pro@10.22" do
  version "10.22.0.68245"
  sha256 "6980db7e3aaf17de3a0e5ea3f7b6941e5971520d409feda8ce6e2928fd19c03b"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.22.0.68245-Beta.app"
end
