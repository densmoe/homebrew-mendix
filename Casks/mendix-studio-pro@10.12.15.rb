cask "mendix-studio-pro@10.12.15" do
  version "10.12.15.61202"
  sha256 "28460c5122e3d5b383819afd29e2a524080bdb03cd2af5d51d57617897f77887"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.15.61202-Beta.app"
end
