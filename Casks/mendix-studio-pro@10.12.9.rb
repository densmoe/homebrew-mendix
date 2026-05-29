cask "mendix-studio-pro@10.12.9" do
  version "10.12.9.49475"
  sha256 "5b5e163b5c300cc6efa177781b54a8e5205590db9c4b76807831795fe1a3a9fe"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.9.49475-Beta.app"
end
