cask "mendix-studio-pro@11.6" do
  version "11.6.10"
  sha256 "d8944c1e0f6c9e13681706813c336e7b4f295f9466e8caac848fdc245525ca8c"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.6.10 Beta.app"
end
