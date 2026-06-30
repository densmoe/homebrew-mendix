cask "mendix-studio-pro@10.24.22" do
  version "10.24.22.113362"
  sha256 "28c2d3498864b72d55c32b96935b2bc90d0c24b03ea69236e11bf77d6403cd91"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.22.113362-Beta.app"
end
