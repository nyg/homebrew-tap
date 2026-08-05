cask "crypto-tools" do
  version "0.1.4"
  sha256 "09eeaa881471129653425ce536898b3feacab9015d6df8ee041bb74f762ca023"

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
  depends_on :macos
  depends_on arch: :arm64

  app "Crypto Tools.app"

  postflight do
    # The app is ad-hoc signed but not notarized; Homebrew quarantines it on
    # install, which makes Gatekeeper report it as "damaged". Strip the
    # quarantine attribute so it launches without a manual right-click → Open.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Crypto Tools.app"]
  end

  # The app writes to a folder named after itself, not after its bundle id.
  # "CryptoTools" is the pre-v0.1.2 name, kept here for anyone zapping an old install.
  zap trash: [
    "~/Library/Application Support/Crypto Tools",
    "~/Library/Application Support/CryptoTools",
  ]

  caveats <<~EOS
    Crypto Tools is not notarized. On first launch, right-click the app and select Open.
  EOS
end
