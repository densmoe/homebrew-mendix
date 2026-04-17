cask "mendix-studio-pro@10.13" do
  version "10.13.1.42744"
  sha256 "76ae3033e3f01d6244e5efc5c8fae442c342afd284c7430276dc03ef8767d0dc"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.13.1.42744-Beta.app"
end
