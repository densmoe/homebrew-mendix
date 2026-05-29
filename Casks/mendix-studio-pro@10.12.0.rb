cask "mendix-studio-pro@10.12.0" do
  version "10.12.0.38909"
  sha256 "d0e558ec2b71a75952ef1383ef7b81da41102f94a3796d29adcc419fb78eaaef"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.0.38909-Beta.app"
end
