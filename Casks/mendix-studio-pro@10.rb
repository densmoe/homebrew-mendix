cask "mendix-studio-pro@10" do
  version "10.24.20.105674"
  sha256 "bdcc1a46bf57a81f76f7f4e319691de84823faf39323dedcc3cdd416107aae66"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.20.105674-Beta.app"
end
