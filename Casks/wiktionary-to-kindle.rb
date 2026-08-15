cask "wiktionary-to-kindle" do
  version "2.1.0"
  sha256 "2279c3b717faa4581922ed62bafb23691a473ea18f49bfd8dfaeb69df3980096"

  url "https://github.com/nyg/wiktionary-to-kindle/releases/download/v#{version}/wiktionary-to-kindle-#{version}-macos-arm64.dmg"
  name "Wiktionary to Kindle"
  desc "Converts Wiktionary data into Kindle-compatible MOBI dictionaries"
  homepage "https://github.com/nyg/wiktionary-to-kindle"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The DMG is built on an Apple Silicon runner, so its bundled runtime is arm64-only. Rosetta
  # cannot help here — it translates x86_64 to arm64, not the reverse — so an Intel Mac genuinely
  # cannot run this build.
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Wiktionary to Kindle.app"

  postflight do
    # The app is ad-hoc signed but not notarized; Homebrew quarantines it on install, which makes
    # Gatekeeper report it as "damaged". Strip the quarantine attribute so it launches without a
    # manual right-click → Open.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Wiktionary to Kindle.app"]
  end

  # Dumps and generated dictionaries are deliberately left alone: they live under ~/Documents,
  # they are multi-gigabyte, and a .mobi already copied to a Kindle is the point of the app.
  zap trash: [
    "~/.cache/wiktionary-to-kindle",
    "~/.config/wiktionary-to-kindle",
    "~/.local/state/wiktionary-to-kindle",
  ]

  caveats <<~EOS
    Wiktionary to Kindle is not notarized. On first launch, right-click the app and select Open.

    Dumps and generated dictionaries default to ~/Documents/wiktionary-to-kindle.
    Downloaded dumps are 100 MB to several GB per language edition.
  EOS
end
