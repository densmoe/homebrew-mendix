cask "mendix-studio-pro@10.16.0" do
  version "10.16.0.49747"
  sha256 "be56c8dffa91f5df1ea7fc78187ae97623e838fe14f8a7eac895e6dff5f81f01"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.16.0.49747-Beta.app"
end
