cask "mendix-studio-pro@10.24.3" do
  version "10.24.3.76411"
  sha256 "c74637dca7b2ac63f3fc8f0cafdffc047a641d95eaed9c203a9ad236fbb9e8ae"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.3.76411-Beta.app"
end
