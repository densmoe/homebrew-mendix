cask "mendix-studio-pro@10.16.1" do
  version "10.16.1.50808"
  sha256 "4ec26cc5f17dea263195912e77e15a7ebb80ec6dd7bfbf04229e782ea401360c"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.16.1.50808-Beta.app"
end
