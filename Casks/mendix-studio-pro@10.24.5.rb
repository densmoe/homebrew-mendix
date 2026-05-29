cask "mendix-studio-pro@10.24.5" do
  version "10.24.5.78496"
  sha256 "6196c45dbd0f7cc35d20f76fcbdff2b3dba2db4c33d0825ab76a7b942bf82f0a"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.5.78496-Beta.app"
end
