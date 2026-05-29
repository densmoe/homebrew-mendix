cask "mendix-studio-pro@10.12.16" do
  version "10.12.16.66308"
  sha256 "1fc146ae2c29c811fad63ad22480024c346ea71c589614469f9795e8b774b797"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.16.66308-Beta.app"
end
