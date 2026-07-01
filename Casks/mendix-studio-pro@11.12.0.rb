cask "mendix-studio-pro@11.12.0" do
  version "11.12.0"
  sha256 "66aa6b34d0a912dba8be2f00ed1dea73fcf8533c600b9785a7055362d35f7d8f"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.12.0 Beta.app"
end
