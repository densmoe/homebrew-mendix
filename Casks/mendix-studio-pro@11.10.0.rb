cask "mendix-studio-pro@11.10.0" do
  version "11.10.0"
  sha256 "097a2468b158c3d6f00c04299795825a386b39a9bbd0c9ab5c72c50b6e2f3fc7"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.10.0 Beta.app"
end
