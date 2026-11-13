cask "crypto-tools" do
  version "1.4.1"
  sha256 "9c0ef32ae176a00d6ce5f768d353acac8058440d084bbecf2e92a5aadd901621"

  url "https://github.com/nyg/crypto-tools/releases/download/v#{version}/crypto-tools-#{version}-macos-arm64.dmg"
  name "Crypto Tools"
  desc "Cryptocurrency tools for Binance and Kraken"
  homepage "https://github.com/nyg/crypto-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Only an arm64 DMG is published, so refuse on Intel rather than installing an
  # app that cannot launch.
  depends_on arch: :arm64
  depends_on :macos

  app "Crypto Tools.app"

  postflight_steps do
    # The app is ad-hoc signed but not notarized; Homebrew quarantines it on
    # install, which makes Gatekeeper report it as "damaged". Strip the
    # quarantine attribute so it launches without a manual right-click → Open.
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Crypto Tools.app"]
  end

  # The app writes to a folder named after itself, not after its bundle id.
  # "CryptoTools" is the pre-v0.1.2 name, kept here for anyone zapping an old install.
  zap trash: [
    "~/Library/Application Support/Crypto Tools",
    "~/Library/Application Support/CryptoTools",
  ]

  caveats <<~EOS
    Crypto Tools is not notarized. If blocked, click Open Anyway in System Settings → Privacy & Security.
  EOS
end
