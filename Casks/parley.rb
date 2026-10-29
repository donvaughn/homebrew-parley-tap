# Written by scripts/publish.sh from packaging/homebrew/parley.rb in Parley's repo: edit it there.
cask "parley" do
  version "0.1.0,98"
  sha256 "8fbd6041ce0a3dded3a7cc282c2fcd31d5cb1cf790df04a550f4040f357a71dd"

  url "https://github.com/donvaughn/homebrew-parley-tap/releases/download/parley-#{version.csv.first}-#{version.csv.second}/Parley.dmg"
  name "Parley"
  desc "Dictation in any app: speak, and cleaned-up text appears at the cursor"
  homepage "https://github.com/donvaughn/homebrew-parley-tap"

  livecheck do
    url :url
    strategy :github_latest do |json|
      match = json["tag_name"]&.match(/^parley-(\d+(?:\.\d+)+)-(\d+)$/i)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Parley.app"

  uninstall quit: "com.donvaughn.parley"

  zap trash: [
    "~/Library/Application Support/FluidAudio/Models/parakeet-ctc-110m-coreml",
    "~/Library/Application Support/Parley",
    "~/Library/Caches/com.donvaughn.parley",
    "~/Library/HTTPStorages/com.donvaughn.parley",
    "~/Library/Preferences/com.donvaughn.parley.plist",
  ]
end
