cask "mendix-studio-pro@11.8.0" do
  version "11.8.0"
  sha256 "a43655994ae0f463dda9bb48f94e3138a960bc000610d510bbe847ce7476b5b2"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Mendix Studio Pro 11.8.0 Beta.app"
end
