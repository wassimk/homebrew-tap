class St < Formula
  desc "Set your status across Slack and GitHub with a single command"
  homepage "https://github.com/wassimk/st"
  version "0.5.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-aarch64.tar.gz"
    sha256 "c7008e95bf681c0761790fbd1f021057bbf8acd433bf13440ade3d88590517be"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-x86_64.tar.gz"
    sha256 "6e8b7c6f6f08eaed1f31a887707ee084488b71e08197e90de6c02b3476b8c748"
  end

  def install
    bin.install "st"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/st --version")
  end
end
