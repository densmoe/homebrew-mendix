cask "mendix-studio-pro@10.8.1" do
  version "10.8.1.29725"
  sha256 "5725b91eb9c13209eeed602d8f24da6005e005282899760496e26fbcb488de32"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.8.1.29725-Beta.app"
end
