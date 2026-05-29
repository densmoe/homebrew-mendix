cask "mendix-studio-pro@10.18.12" do
  version "10.18.12.82546"
  sha256 "b34cdb8c42e600e91e208bfc7aeea28c30807e1cbe182a6992ff8c1fa4566593"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.12.82546-Beta.app"
end
