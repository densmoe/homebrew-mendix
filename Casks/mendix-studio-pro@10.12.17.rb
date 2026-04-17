cask "mendix-studio-pro@10.12.17" do
  version "10.12.17.70709"
  sha256 "2417f322dff6d301d258bd3ef1dd035ee72fa82f1928f7526a0f158e9727b814"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.17.70709-Beta.app"
end
