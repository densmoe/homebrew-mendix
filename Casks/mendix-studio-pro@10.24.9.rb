cask "mendix-studio-pro@10.24.9" do
  version "10.24.9.81004"
  sha256 "1ef5d7ac024528637947bf3487482f3b3bc95c61cb7d1fe3edb66e360dcf26ec"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.9.81004-Beta.app"
end
