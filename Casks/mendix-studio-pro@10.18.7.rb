cask "mendix-studio-pro@10.18.7" do
  version "10.18.7.70712"
  sha256 "d6906f4b3cb8f3fa69a8f75e850e2623d979f89bbfc2e1666fc6a40eac9da8dc"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.7.70712-Beta.app"
end
