cask "mendix-studio-pro@10.24" do
  version "10.24.17.102810"
  sha256 "60390a8df5d7094ec92f7053c89442d964a93b23c8ea7f795b23ce2eaa4f2ea7"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.17.102810-Beta.app"
end
