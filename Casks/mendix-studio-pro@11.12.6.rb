cask "mendix-studio-pro@11.12.6" do
  version "11.12.6"
  sha256 "12952803356db98d25fa9049eab5c6843929a4bbe69005adacf67241669f44f1"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.12.6 Beta.app"
end
