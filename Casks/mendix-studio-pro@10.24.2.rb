cask "mendix-studio-pro@10.24.2" do
  version "10.24.2.75382"
  sha256 "aa28cef00381d4632bf7c2573c19c62e368d247e75379aa1e8daed304b2fb05b"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.2.75382-Beta.app"
end
