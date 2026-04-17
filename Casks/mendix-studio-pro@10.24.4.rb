cask "mendix-studio-pro@10.24.4" do
  version "10.24.4.77222"
  sha256 "7263b5dd3d2a4f6424d3ffd1da5975e92f9ec63ac7d93ac909ef689db43358c3"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.4.77222-Beta.app"
end
