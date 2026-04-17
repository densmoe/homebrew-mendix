cask "mendix-studio-pro@10.12.1" do
  version "10.12.1.39914"
  sha256 "5bd6778f3565dd0a8bf9e54043f20777376705750bef4a5b8f7a810bdfd41186"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.1.39914-Beta.app"
end
