cask "mendix-studio-pro@10.12.2" do
  version "10.12.2.41995"
  sha256 "04495da5da6af514a4ea0e47edfb5e8e26b1bb53b0885d47a959aa740441cdc0"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.12.2.41995-Beta.app"
end
