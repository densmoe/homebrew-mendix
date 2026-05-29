cask "mendix-studio-pro@10.14" do
  version "10.14.0.44044"
  sha256 "a4c7d3f13b4f97049036e80004d38a129abf1770f115db3c8892e11afdbeff2e"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.14.0.44044-Beta.app"
end
