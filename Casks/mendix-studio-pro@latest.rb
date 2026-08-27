cask "mendix-studio-pro@latest" do
  version "11.14.0"
  sha256 "278c90c2d08247b5a434c9a257c6ad37a292685e3253e167b0470207d89621be"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.14.0 Beta.app"
end
