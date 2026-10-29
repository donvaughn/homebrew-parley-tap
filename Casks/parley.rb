# Written by scripts/publish.sh from packaging/homebrew/parley.rb in Parley's repo: edit it there.
cask "parley" do
  version "0.1.0,96"
  sha256 "911913ed24d55b31a5c1881f450b8bb15cb51e5eca177a3523eb73efcc37e01d"

  url "https://github.com/donvaughn/homebrew-tap/releases/download/parley-#{version.csv.first}-#{version.csv.second}/Parley.dmg"
  name "Parley"
  desc "Dictation in any app: speak, and cleaned-up text appears at the cursor"
  homepage "https://github.com/donvaughn/homebrew-tap"

  depends_on macos: ">= :tahoe"
  depends_on arch: :arm64

  app "Parley.app"

  uninstall quit: "com.donvaughn.parley"

  zap trash: [
    "~/Library/Application Support/Parley",
    "~/Library/Caches/com.donvaughn.parley",
    "~/Library/HTTPStorages/com.donvaughn.parley",
    "~/Library/Preferences/com.donvaughn.parley.plist",
  ]
end
