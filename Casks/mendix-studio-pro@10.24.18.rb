cask "mendix-studio-pro@10.24.18" do
  version "10.24.18.103793"
  sha256 "025d1d283cbaee5bd1f92cf9193ea779ab875e9cfa04d22b5fb4dc6171e0e4c2"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.18.103793-Beta.app"
end
