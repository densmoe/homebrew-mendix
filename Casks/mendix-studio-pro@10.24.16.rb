cask "mendix-studio-pro@10.24.16" do
  version "10.24.16.96987"
  sha256 "4b2e45efda4a36d6d8d194b89ec7a14046009d64e2065665e22e0c9975af9d63"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.16.96987-Beta.app"
end
