cask "mendix-studio-pro@11.6.6" do
  version "11.6.6"
  sha256 "55ad1d3f641b54b0eca45a42f91286a33a0110476c9df6be310e1be5a4ac0aac"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.6 Beta.app"
end
