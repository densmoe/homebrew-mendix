cask "mendix-studio-pro@10.18.8" do
  version "10.18.8.73790"
  sha256 "9cf229b432f44f3be07ff683bb334259b0395fe9d22dc6bafce8bef589c55957"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.8.73790-Beta.app"
end
