cask "mendix-studio-pro@10.18.3" do
  version "10.18.3.58900"
  sha256 "4475ff1a9cd0929950bbff38ced39ef35977b497efd7b2581b4fe5dd4552a993"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.3.58900-Beta.app"
end
