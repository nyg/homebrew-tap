cask "qoqa-compta" do
  version "0.1.0"
  sha256 "576ed17752d94b092ec6c843624f8190b21b6ec3db7319410437a046f1f948d2"

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

  postflight do
    # The app is ad-hoc signed but not notarized; Homebrew quarantines it on
    # install, which makes Gatekeeper report it as "damaged". Strip the
    # quarantine attribute so it launches without a manual right-click → Open.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/QoQa Compta.app"]
  end

  zap trash: "~/Library/Application Support/qoqa-compta"

  caveats <<~EOS
    QoQa Compta is not notarized. On first launch, right-click the app and select Open.
  EOS
end
