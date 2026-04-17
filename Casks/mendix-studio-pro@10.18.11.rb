cask "mendix-studio-pro@10.18.11" do
  version "10.18.11.76840"
  sha256 "1487e709b5edef40fa9fb7833515603ac981fafb9f1f47664c3f2b394f9cde29"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.11.76840-Beta.app"
end
