cask "mendix-studio-pro@11.6.3" do
  version "11.6.3"
  sha256 "afe8d7d66a5f49380e86cb322d48b4cb3f107757db6ffc4bbacd569d6e3a3b0a"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.3 Beta.app"
end
