cask "mendix-studio-pro@11.5" do
  version "11.5.0"
  sha256 "a7afa705d6b0e572e176c2cbc251272b8d340ba359f41b83cfe32d094eac05c5"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.5.0 Beta.app"
end
