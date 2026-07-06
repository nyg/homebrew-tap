class Jmxsh < Formula
  desc "Command-line JMX client for monitoring and managing Java applications"
  homepage "https://github.com/nyg/jmxsh"
  url "https://github.com/nyg/jmxsh/releases/download/v1.5.0/jmxsh-1.5.0.jar"
  sha256 "8391c9b965544ef6a43b8c0cd025947a9e13d79290753043849bc6cc1992737a"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/nyg/homebrew-tap/releases/download/jmxsh-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bd3342cedcb1f588c41b7d4d0e558e6dc609974d0a89564f180c5ada35215be8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "729aaabd5f798f3c7186b65849d2da7ed61877ffbd3505a4adeaa564e0967d94"
  end

  depends_on "openjdk@25"

  def install
    libexec.install "jmxsh-#{version}.jar"
    bin.write_jar_script libexec/"jmxsh-#{version}.jar", "jmxsh"
  end

  test do
    assert_match "jmxsh #{version}", shell_output("#{bin}/jmxsh --version")
  end
end
