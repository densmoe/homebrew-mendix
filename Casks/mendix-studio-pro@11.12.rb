cask "mendix-studio-pro@11.12" do
  version "11.12.1"
  sha256 "4e18864a983f5bec7baa5bb182507d50e581a6c519612ae7cad0ad76d8c713ce"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.12.1 Beta.app"
end
