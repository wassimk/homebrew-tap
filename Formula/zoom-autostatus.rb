class ZoomAutostatus < Formula
  desc "Automatically set your Slack status while you're in a Zoom meeting"
  homepage "https://github.com/wassimk/zoom-autostatus"
  version "0.2.0"
  license "MIT"

  depends_on "wassimk/tap/st"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/zoom-autostatus/releases/download/v#{version}/zoom-autostatus-Darwin-aarch64.tar.gz"
    sha256 "d9ad9700da1c1d2081c3cdf29c1189b7d53a24db7bd65c31722fb1e4b18e2588"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/zoom-autostatus/releases/download/v#{version}/zoom-autostatus-Darwin-x86_64.tar.gz"
    sha256 "7fa9bad06de3b4b2370b2a272489bc0abe1a0acf96e005a757f8df2427033f7a"
  end

  def install
    bin.install "zoom-autostatus"
  end

  def caveats
    <<~EOS
      To start zoom-autostatus as a background service, run:
        zoom-autostatus install

      To remove the background service:
        zoom-autostatus uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zoom-autostatus --version")
  end
end
