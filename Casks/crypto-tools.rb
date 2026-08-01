cask "crypto-tools" do
  version "0.1.0"
  sha256 "6e91247192d95e48b33275c1376390247ffc2c561fcf9d65a15040572d2e2ed1"

  url "https://github.com/nyg/crypto-tools/releases/download/v#{version}/CryptoTools.dmg"
  name "CryptoTools"
  desc "Cryptocurrency tools for Binance, Kraken, and SwissBorg"
  homepage "https://github.com/nyg/crypto-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "CryptoTools.app"

  postflight do
    # The app is ad-hoc signed but not notarized; Homebrew quarantines it on
    # install, which makes Gatekeeper report it as "damaged". Strip the
    # quarantine attribute so it launches without a manual right-click → Open.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CryptoTools.app"]
  end

  zap trash: "~/Library/Application Support/io.github.nyg.crypto-tools"

  caveats <<~EOS
    CryptoTools is not notarized. On first launch, right-click the app and select Open.
  EOS
end
