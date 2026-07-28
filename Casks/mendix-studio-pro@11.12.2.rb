cask "mendix-studio-pro@11.12.2" do
  version "11.12.2"
  sha256 "d64904055eede3ab3ec3a023beb7f1c46a5251461ece40dcb0359ed5e52f55ac"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.12.2 Beta.app"
end
