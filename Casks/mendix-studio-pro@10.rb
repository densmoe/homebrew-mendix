cask "mendix-studio-pro@10" do
  version "10.24.21.108016"
  sha256 "34a9b3d7409162b0e493ce29cf958cbcd1b3ef55ee7e8414504e7a1448005c90"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.21.108016-Beta.app"
end
