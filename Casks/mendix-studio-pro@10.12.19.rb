cask "mendix-studio-pro@10.12.19" do
  version "10.12.19.81612"
  sha256 "cb530535bbfbc37f16e408473d6bf04f3c31c6c24361db4d6886911a0e21b05c"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.19.81612-Beta.app"
end
