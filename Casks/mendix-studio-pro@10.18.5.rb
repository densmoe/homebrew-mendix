cask "mendix-studio-pro@10.18.5" do
  version "10.18.5.65446"
  sha256 "bf83966dbbdf5eb783afd4f849bc10c9e1b94f5f8d779f758d6d4ae0c6930ee2"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.5.65446-Beta.app"
end
