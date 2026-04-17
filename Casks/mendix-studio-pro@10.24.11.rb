cask "mendix-studio-pro@10.24.11" do
  version "10.24.11.83811"
  sha256 "30f0994d7f2a3654281bcfd240a07e04bb1328f9c884f74e740849cde3afe670"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.11.83811-Beta.app"
end
