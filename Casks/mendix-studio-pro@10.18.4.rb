cask "mendix-studio-pro@10.18.4" do
  version "10.18.4.61760"
  sha256 "5ef763b733691dd658f9dfcf7fc57202b64efa2ed4994ec6c8385b678f5a04f9"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.4.61760-Beta.app"
end
