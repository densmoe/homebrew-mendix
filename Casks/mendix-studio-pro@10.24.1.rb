cask "mendix-studio-pro@10.24.1" do
  version "10.24.1.74050"
  sha256 "d0f84307ef59d545c19ce68db45cee4fee987e6de6194aa78e30f8fc10deee10"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.1.74050-Beta.app"
end
