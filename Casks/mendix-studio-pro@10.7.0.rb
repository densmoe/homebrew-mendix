cask "mendix-studio-pro@10.7.0" do
  version "10.7.0.26214"
  sha256 "76e37a09fc966513d180f4f7f03fff32c622b76d068a5a25d99beab57fd24972"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.7.0.26214-Beta.app"
end
