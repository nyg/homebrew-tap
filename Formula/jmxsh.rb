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
