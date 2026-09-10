cask "mendix-studio-pro@11.6.11" do
  version "11.6.11"
  sha256 "0fa6f8390c0727607ecb79434d75ac1c779065527a99a8a8f9c71f56cdbb7bba"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.11 Beta.app"
end
