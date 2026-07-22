cask "mendix-studio-pro@10" do
  version "10.24.23.117076"
  sha256 "51c45a84313e083695927b4e70d93b1fb8c80ae5eb5bbf3200e02679d4319e58"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.23.117076-Beta.app"
end
