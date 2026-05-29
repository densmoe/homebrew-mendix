cask "mendix-studio-pro@10.12.13" do
  version "10.12.13.58507"
  sha256 "0c210fa0258467cf2dbd8b7477c4e34040155a668e1aec153b0d66f3af172d31"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.13.58507-Beta.app"
end
