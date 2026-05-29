cask "mendix-studio-pro@11.6.0" do
  version "11.6.0"
  sha256 "09a3df0359a16097f4647a699df2943a5cb0d9cb25c720862a77db96bd7fce9a"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.0 Beta.app"
end
