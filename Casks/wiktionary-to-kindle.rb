cask "wiktionary-to-kindle" do
  version "2.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/nyg/wiktionary-to-kindle/releases/download/v#{version}/WiktionaryToKindle.dmg"
  name "Wiktionary to Kindle"
  desc "Converts Wiktionary data into Kindle-compatible MOBI dictionaries"
  homepage "https://github.com/nyg/wiktionary-to-kindle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Wiktionary to Kindle.app"

  postflight do
    # The app is ad-hoc signed but not notarized; Homebrew quarantines it on install, which makes
    # Gatekeeper report it as "damaged". Strip the quarantine attribute so it launches without a
    # manual right-click → Open.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Wiktionary to Kindle.app"]
  end

  zap trash: [
    "~/.config/wiktionary-to-kindle",
    "~/.cache/wiktionary-to-kindle",
  ]

  caveats <<~EOS
    Wiktionary to Kindle is not notarized. On first launch, right-click the app and select Open.

    Dumps and generated dictionaries default to ~/Documents/wiktionary-to-kindle.
    Downloaded dumps are 100 MB to several GB per language edition.
  EOS
end
