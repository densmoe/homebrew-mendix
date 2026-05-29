cask "mendix-studio-pro@11.6.5" do
  version "11.6.5"
  sha256 "1d8e79001a3f4c202767083b48216ae91daab671b25d6ab99b13c481e5ab38a1"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.5 Beta.app"
end
