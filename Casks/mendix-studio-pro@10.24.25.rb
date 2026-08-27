cask "mendix-studio-pro@10.24.25" do
  version "10.24.25.122571"
  sha256 "9fc00266d6d323674d009063eb2a62225da90bc401d3d2823b3e0e07893b50a5"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.25.122571-Beta.app"
end
