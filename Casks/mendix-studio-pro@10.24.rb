cask "mendix-studio-pro@10.24" do
  version "10.24.27.128337"
  sha256 "d83bb21f630b468d204c13c344afc3fb44425b3896467a6ee41640e5e11b3688"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.27.128337-Beta.app"
end
