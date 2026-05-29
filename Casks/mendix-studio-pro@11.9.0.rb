cask "mendix-studio-pro@11.9.0" do
  version "11.9.0"
  sha256 "172cda6e870659568d863cf026ba50cd90b3d80d70165dbebcb95c2e2a5a5111"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.9.0 Beta.app"
end
