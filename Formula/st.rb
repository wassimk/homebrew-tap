class St < Formula
  desc "Set your status across Slack and GitHub with a single command"
  homepage "https://github.com/wassimk/st"
  version "0.6.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-aarch64.tar.gz"
    sha256 "a455501f70299541cea474c24c15055551b32d4f1c9944050ab0799acd5bd67d"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/st/releases/download/v#{version}/st-Darwin-x86_64.tar.gz"
    sha256 "68bf168d763926f6e42835a5d13e8190f34c72fe217bbe6b06fa6cd2a68d9b74"
  end

  def install
    bin.install "st"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/st --version")
  end
end
