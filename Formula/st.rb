class St < Formula
  desc "Set your status across Slack and GitHub with a single command"
  homepage "https://github.com/wassimk/st"
  version "0.6.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-aarch64.tar.gz"
    sha256 "5caf536a14aab7ebc83b38b9612456ab1d55de668e7318e6324037c6882e7a62"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-x86_64.tar.gz"
    sha256 "dccaa521f210b2de2181d7c4433c4cafbec9fecd71e2c7b55ccd2d2b658b367b"
  end

  def install
    bin.install "st"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/st --version")
  end
end
