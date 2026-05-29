cask "mendix-studio-pro@10.19.0" do
  version "10.19.0.57669"
  sha256 "6c31541c800d9ebe412b4d042ac1ed1bef71a5bfdea7c228a7724f1046931618"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.19.0.57669-Beta.app"
end
