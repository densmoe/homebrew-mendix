cask "mendix-studio-pro@11.12.5" do
  version "11.12.5"
  sha256 "262ff8ae6280723475ae4dbfd0789f686f9cedbd6633c5af1656ffc0bb0101d9"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.12.5 Beta.app"
end
