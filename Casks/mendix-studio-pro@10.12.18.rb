cask "mendix-studio-pro@10.12.18" do
  version "10.12.18.79383"
  sha256 "e46dd146613cec50b655ed43b187d5dfe8f1e191ec5be24f2825a66160088c86"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.18.79383-Beta.app"
end
