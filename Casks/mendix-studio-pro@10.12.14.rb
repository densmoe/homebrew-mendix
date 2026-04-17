cask "mendix-studio-pro@10.12.14" do
  version "10.12.14.59401"
  sha256 "f42739027c0c1f38d3e8cf32bbccbadaaac92a3843dbb0587412118b35779eec"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.14.59401-Beta.app"
end
