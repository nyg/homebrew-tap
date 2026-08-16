class Jmxsh < Formula
  desc "Command-line JMX client for monitoring and managing Java applications"
  homepage "https://github.com/nyg/jmxsh"
  url "https://github.com/nyg/jmxsh/releases/download/v1.5.2/jmxsh-1.5.2.jar"
  sha256 "c7c1f9da8a8f8f26d6c7f1a57f0494aef32cb6f0c600e4d997ee0116eb97436a"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/nyg/homebrew-tap/releases/download/jmxsh-1.5.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0794a5360c086f11db6edcbf2e9fbd9bf59d0addfde8646500c58b4cc9d88535"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c0622b15e5573cc4a01dc0ebc113c5b03f63defac690aabc191e7ec48903c0d5"
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
