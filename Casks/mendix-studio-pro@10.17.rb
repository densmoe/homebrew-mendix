cask "mendix-studio-pro@10.17" do
  version "10.17.0.52220"
  sha256 "d81b2e591653ee518bbb0b37fffb64638aeb1d66cd5b3e72d2d7d0905977ba47"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.17.0.52220-Beta.app"
end
