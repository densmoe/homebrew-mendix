cask "mendix-studio-pro@10.8.0" do
  version "10.8.0.28569"
  sha256 "f528164706b2e3633f8770855680f26628e6f31663313a1372529350130f99a9"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.8.0.28569-Beta.app"
end
