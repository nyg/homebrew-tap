cask "qoqa-compta" do
  version "0.0.10"
  sha256 "9fb1f00c28665515c8b65747db4200916e82b4504a9eaad66ac4aa2b7176c56b"

  url "https://github.com/nyg/qoqa-compta/releases/download/v#{version}/QoQa.Compta.dmg"
  name "QoQa Compta"
  desc "QoQa order accounting and invoice viewer"
  homepage "https://github.com/nyg/qoqa-compta"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "QoQa Compta.app"

  zap trash: [
    "~/Library/Application Support/qoqa-compta",
  ]

  caveat <<~EOS
    QoQa Compta is not notarized. On first launch, right-click the app and select Open.
  EOS
end
