class St < Formula
  desc "Set your status across Slack and GitHub with a single command"
  homepage "https://github.com/wassimk/st"
  version "0.3.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-aarch64.tar.gz"
    sha256 "3496600e790e7cd74f6f7620e341ee6cd952b9e776d6bec8f6b82cdc73d84591"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-x86_64.tar.gz"
    sha256 "94a3a7da0bbcc2a7eed19cb4d5f8ceabd0380aa11a0d2130f3c11af3ff554d06"
  end

  def install
    bin.install "st"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/st --version")
  end
end
