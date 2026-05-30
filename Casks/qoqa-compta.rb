cask "qoqa-compta" do
  version "0.0.11"
  sha256 "1a9e24b0599e838915586a131208548b7cd04b498d4a111338134dc441422f8b"

  url "https://github.com/nyg/qoqa-compta/releases/download/v#{version}/QoQa.Compta.dmg"
  name "QoQa Compta"
  desc "QoQa order accounting and invoice viewer"
  homepage "https://github.com/nyg/qoqa-compta"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "QoQa Compta.app"

  zap trash: "~/Library/Application Support/qoqa-compta"

  caveats <<~EOS
    QoQa Compta is not notarized. On first launch, right-click the app and select Open.
  EOS
end
