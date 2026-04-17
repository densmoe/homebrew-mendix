cask "mendix-studio-pro@10.24.14" do
  version "10.24.14.90436"
  sha256 "696a26354129c1cd3eb2bade7f9867a9f61a93d8f24ad94f9fa699f7b200ec66"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.14.90436-Beta.app"
end
