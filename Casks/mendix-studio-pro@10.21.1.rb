cask "mendix-studio-pro@10.21.1" do
  version "10.21.1.64969"
  sha256 "f233958b777db423d0aeb0ffd54c7cf8eded5e5d7896f09575086e10d4580d8e"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/Studio Pro 10.21.1.64969-Beta.app"
end
