cask "mendix-studio-pro@10.18.1" do
  version "10.18.1.55792"
  sha256 "6aeeaab46868fdcd703edb3e8d5d87d45828c145a2d8c06ac704fe76bf65c56c"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.1.55792-Beta.app"
end
