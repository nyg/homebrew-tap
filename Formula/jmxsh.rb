class Jmxsh < Formula
  desc "Command-line JMX client for monitoring and managing Java applications"
  homepage "https://github.com/nyg/jmxsh"
  url "https://github.com/nyg/jmxsh/releases/download/v1.3.1/jmxsh-1.3.1.jar"
  sha256 "6be640480bca7da33c02ef53a43516e7c946cfcefc57e086dfbf07c066e9d8dc"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/nyg/homebrew-tap/releases/download/jmxsh-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ee02a1146e1b4bf553f41b476c5ceee30cb3cc5839244f4c607b25b753427bb1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9190fc33e6ceedc3b84926126048abd97cb9d608c1c07e5dd83e356aa81afe53"
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
