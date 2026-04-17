cask "mendix-studio-pro@10.10.0" do
  version "10.10.0.34429"
  sha256 "3b91f95ee92dcf5a5531d02d09cf2e60db9d99d88be3cbdbe2ef6963ab6e3735"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.10.0.34429-Beta.app"
end
