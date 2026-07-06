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
    root_url "https://github.com/nyg/homebrew-tap/releases/download/jmxsh-1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0b48aaa91e89e8e90a00d2de654910734681f3736136b6eb5d608d61a6970ba8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ea22c95d0acdab6a6723919166e728b96f7184a3691ca5b2d28565a36f74a37e"
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
