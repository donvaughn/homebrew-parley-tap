# Written by scripts/publish.sh from packaging/homebrew/parley.rb in Parley's repo: edit it there.
cask "parley" do
  version "0.1.1,172"
  sha256 "f99ac5a6eac968543c539946af138743021aa77506dfc046e5d2cd90f0707e87"

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

  caveats <<~EOS
    To remove Parley completely, with your dictation history, dictionary and the speech model,
    choose "Uninstall Parley…" in Parley's menu, or run:
      brew uninstall --zap parley
    A plain "brew uninstall parley" removes only the app and keeps the rest.
  EOS

  zap trash: [
    "~/Library/Application Support/FluidAudio/Models/parakeet-ctc-110m-coreml",
    "~/Library/Application Support/Parley",
    "~/Library/Caches/com.donvaughn.parley",
    "~/Library/HTTPStorages/com.donvaughn.parley",
    "~/Library/Preferences/com.donvaughn.parley.plist",
  ]
end
