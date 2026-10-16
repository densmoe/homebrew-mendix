cask "mendix-studio-pro@10" do
  version "10.24.28.129343"
  sha256 "9578fd68e94f0c5e7195231a0c22b66849a18316522a8b47577eb042deb76aa6"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  depends_on :macos

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.24.28.129343-Beta.app"
end
