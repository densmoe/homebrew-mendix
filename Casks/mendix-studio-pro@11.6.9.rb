cask "mendix-studio-pro@11.6.9" do
  version "11.6.9"
  sha256 "d0117e2226a8c6b3cefcf76247da4e4dbce7c35b79597176aa31f42c3c08ae47"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.9 Beta.app"
end
