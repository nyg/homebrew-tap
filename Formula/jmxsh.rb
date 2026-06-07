class Jmxsh < Formula
  desc "Command-line JMX client for monitoring and managing Java applications"
  homepage "https://github.com/nyg/jmxsh"
  url "https://github.com/nyg/jmxsh/releases/download/v1.4.0/jmxsh-1.4.0.jar"
  sha256 "ccd9c7457b7b76d375bbecd305ffe45d76cdaa8cb8d2fce83f4184b0d0ef8ac3"
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
