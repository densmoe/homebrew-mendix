cask "mendix-studio-pro@10.12.4" do
  version "10.12.4.44290"
  sha256 "ee328af431e2f4df7c76271853092c93f7565d9e35f085a856e05c3c69ed4354"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.4.44290-Beta.app"
end
