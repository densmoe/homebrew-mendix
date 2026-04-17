cask "mendix-studio-pro@10.12.10" do
  version "10.12.10.51938"
  sha256 "1cc4d92436170838b683717fd455621f6aa0e2a3b9596b2474caec9e3d50ac53"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.10.51938-Beta.app"
end
