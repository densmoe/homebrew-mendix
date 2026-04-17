cask "mendix-studio-pro@10.12.12" do
  version "10.12.12.57758"
  sha256 "9d2134a50499e5df928ca56ba72d2ba63af9ae78c66b044e46e042cd3e64ba11"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.12.57758-Beta.app"
end
