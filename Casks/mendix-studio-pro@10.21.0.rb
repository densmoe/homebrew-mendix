cask "mendix-studio-pro@10.21.0" do
  version "10.21.0.64362"
  sha256 "4003080e91913f6860d31f4a87f3f396893fe2a4175e8fc573fff39775dfb70e"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.21.0.64362-Beta.app"
end
