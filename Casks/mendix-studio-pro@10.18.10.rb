cask "mendix-studio-pro@10.18.10" do
  version "10.18.10.76219"
  sha256 "ae7bd07c8eeb3dad8d2b6caad8e2e36a7b70e77ebc884ea8bf6ebb9862921de1"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.10.76219-Beta.app"
end
