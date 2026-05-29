cask "mendix-studio-pro@10.24.12" do
  version "10.24.12.86709"
  sha256 "74977ff96cf70149a6045fd23dbbee6790eaa8aa19af7de9207eb11f5e5d2d48"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.12.86709-Beta.app"
end
