cask "mendix-studio-pro@10.12.8" do
  version "10.12.8.48735"
  sha256 "c695fcbfdf1198c823c5624d3473419d00f4da76e0176a30b3eb9f6effe53728"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.8.48735-Beta.app"
end
