cask "mendix-studio-pro@11.6.1" do
  version "11.6.1"
  sha256 "c38a353626a298361e9720e5c2320a60655017ee518f1689b4a2903ea479da56"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.1 Beta.app"
end
