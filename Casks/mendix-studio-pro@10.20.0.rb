cask "mendix-studio-pro@10.20.0" do
  version "10.20.0.60519"
  sha256 "3c0bbd8b5fb171a344c61b39e094732da53bfefbbdc98470deef8e6d509990ee"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.20.0.60519-Beta.app"
end
