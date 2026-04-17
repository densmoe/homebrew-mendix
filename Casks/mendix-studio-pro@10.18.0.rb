cask "mendix-studio-pro@10.18.0" do
  version "10.18.0.54340"
  sha256 "b3284f532cb4b35c89c93eab5e65e6bb0b2653bf8bc49ef2750c21c0d9171056"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.0.54340-Beta.app"
end
