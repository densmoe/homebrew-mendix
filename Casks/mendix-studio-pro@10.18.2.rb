cask "mendix-studio-pro@10.18.2" do
  version "10.18.2.58475"
  sha256 "4eb7a8116cb1d54147333619bab86f7200ca63b2504bd09154eb278a21b7d3ae"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.2.58475-Beta.app"
end
