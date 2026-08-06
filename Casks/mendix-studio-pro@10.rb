cask "mendix-studio-pro@10" do
  version "10.24.24.119653"
  sha256 "0ce239fb7f3262b80e3a25ab8530ca77f3b17f36a1a6be20f983a8db44be0a33"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.24.119653-Beta.app"
end
