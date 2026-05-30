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
    root_url "https://github.com/nyg/homebrew-tap/releases/download/jmxsh-1.3.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9c21e36c60b5e60496a0f5c025c4e23b2d82ba8f820fb283a8647b69be5b2947"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b688de0854c251b617d3ae9739515d410d8f0b310e13cbba37421e8284b4f039"
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
