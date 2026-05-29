cask "mendix-studio-pro@10.11" do
  version "10.11.0.37074"
  sha256 "1e5f27fd216de27ae3bab7ed0ff269b9529f1b6f7f59afe4606673ec40899d90"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.11.0.37074-Beta.app"
end
