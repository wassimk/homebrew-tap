class St < Formula
  desc "Set your status across Slack and GitHub with a single command"
  homepage "https://github.com/wassimk/st"
  version "0.2.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-aarch64.tar.gz"
    sha256 "0820a84b78004d36e4885b71f6bfe93f3d7ac6a2f756967ae905a13495b6c31d"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-x86_64.tar.gz"
    sha256 "4dd7b87ef45cecf17daa0c0d18dfce015b14c617f6ce833919de458bdc091d72"
  end

  def install
    bin.install "st"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/st --version")
  end
end
