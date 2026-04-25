cask "mendix-studio-pro@10.24.19" do
  version "10.24.19.104498"
  sha256 "aa0f70a16626776ccb64fd2b1c955493bbe374df33ae36865c1628e7705018dc"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.19.104498-Beta.app"
end
