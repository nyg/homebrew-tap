cask "crypto-tools" do
  version "0.0.11"
  sha256 "35e4f0af06a238dd1d246559006a0644f46d97ed0a228b61e4465beb275a0719"

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
