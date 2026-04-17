cask "mendix-studio-pro@10.24.0" do
  version "10.24.0.73019"
  sha256 "2ad78c2ed2970a658a08a58bff48d3c3356c00d9c3fb12c1de37758c3c768bb4"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.0.73019-Beta.app"
end
