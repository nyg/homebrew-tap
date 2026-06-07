cask "crypto-tools" do
  version "0.0.9"
  sha256 "051a8e7555fcfee3d874b3f780745eb3a63c456d6646514fbde80906d1d84258"

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
