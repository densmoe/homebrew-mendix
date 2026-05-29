cask "mendix-studio-pro@10.12.3" do
  version "10.12.3.43016"
  sha256 "a1a4151262500f0b27e3add3257e75d5ecdbe8826ff56e5f11ed761d3b867750"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.3.43016-Beta.app"
end
