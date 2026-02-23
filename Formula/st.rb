class St < Formula
  desc "Set your status across Slack, GitHub, and Asana with a single command"
  homepage "https://github.com/wassimk/st"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-aarch64.tar.gz"
    sha256 "9d28a66beac1223fed0c1ef1f9bc87c162ac2c2f3564de8d9340dd585c43ecdb"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-x86_64.tar.gz"
    sha256 "1ff6a3f714a6a7990f942540f7d7371185a602dcb8b81f8cbb378efff9888ad2"
  end

  def install
    bin.install "st"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/st --version")
  end
end
