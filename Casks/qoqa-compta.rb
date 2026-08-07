cask "qoqa-compta" do
  version "0.2.0"
  sha256 "406863371fa9863c167f928337d48725a64781cd5945c9475732953f37255c53"

  url "https://github.com/nyg/qoqa-compta/releases/download/v#{version}/qoqa-compta-#{version}-macos-arm64.dmg"
  name "QoQa Compta"
  desc "QoQa order accounting and invoice viewer"
  homepage "https://github.com/nyg/qoqa-compta"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Only an arm64 DMG is published, so refuse on Intel rather than installing an
  # app that cannot launch.
  depends_on :macos
  depends_on arch: :arm64

  app "QoQa Compta.app"

  postflight do
    # The app is ad-hoc signed but not notarized; Homebrew quarantines it on
    # install, which makes Gatekeeper report it as "damaged". Strip the
    # quarantine attribute so it launches without a manual right-click → Open.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/QoQa Compta.app"]
  end

  # The app writes its settings and database to a folder named after itself;
  # everything else is keyed by bundle id and left behind by the WebView.
  # "qoqa-compta" is the pre-rename name, kept here for anyone zapping an old
  # install.
  zap trash: [
    "~/Library/Application Support/io.github.nyg.qoqa-compta",
    "~/Library/Application Support/QoQa Compta",
    "~/Library/Application Support/qoqa-compta",
    "~/Library/Caches/io.github.nyg.qoqa-compta",
    "~/Library/Preferences/io.github.nyg.qoqa-compta.plist",
    "~/Library/WebKit/io.github.nyg.qoqa-compta",
  ]

  caveats <<~EOS
    QoQa Compta is not notarized. On first launch, right-click the app and select Open.
  EOS
end
