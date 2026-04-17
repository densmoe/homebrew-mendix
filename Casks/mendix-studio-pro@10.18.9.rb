cask "mendix-studio-pro@10.18.9" do
  version "10.18.9.74390"
  sha256 "8df5612fa99bfc88406da36c7851bab7c9fc3f2151f25ea53edc0d4ad3620b97"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.18.9.74390-Beta.app"
end
