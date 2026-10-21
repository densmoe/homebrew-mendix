cask "mendix-studio-pro@11.6.12" do
  version "11.6.12"
  sha256 "a5286a2e2691bba0975c2657cc8f3c3ff2bf11afa1ac6ea89bc3ab4f98cc8073"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.12 Beta.app"
end
