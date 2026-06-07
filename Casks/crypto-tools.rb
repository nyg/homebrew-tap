cask "crypto-tools" do
  version "0.0.8"
  sha256 "0f5f1ddc594cd3fde79d976523aedeb6dffccbe6a9f2081d46ab5a9bde6dc4d0"

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

  zap trash: "~/Library/Application Support/io.github.nyg.crypto-tools"

  caveats <<~EOS
    CryptoTools is not notarized. On first launch, right-click the app and select Open.
  EOS
end
