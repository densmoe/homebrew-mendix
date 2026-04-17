cask "mendix-studio-pro@10.12.5" do
  version "10.12.5.45892"
  sha256 "c85f99a2d27209da333f1c035ff45309d8e0ccbc564d6fc0a2c077bcfaeba6ff"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.5.45892-Beta.app"
end
