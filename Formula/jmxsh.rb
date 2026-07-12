class Jmxsh < Formula
  desc "Command-line JMX client for monitoring and managing Java applications"
  homepage "https://github.com/nyg/jmxsh"
  url "https://github.com/nyg/jmxsh/releases/download/v1.5.1/jmxsh-1.5.1.jar"
  sha256 "df67ac21295e049e0c6207b2108824967c7b36dad986f0908fa39a88174d13f3"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/nyg/homebrew-tap/releases/download/jmxsh-1.5.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6016f58d87c3faeacbbf192b6eca94297ae22adba272dd611a78cb50643438d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6bba380aa0da0746c9900b6e081349d0170de9fe7d5ee30d62ee0b6f06f5b70b"
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
