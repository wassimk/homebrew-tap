class ZoomAutostatus < Formula
  desc "Automatically set your Slack status while you're in a Zoom meeting"
  homepage "https://github.com/wassimk/zoom-autostatus"
  version "0.1.1"
  license "MIT"

  depends_on "wassimk/tap/st"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/zoom-autostatus/releases/download/v#{version}/zoom-autostatus-Darwin-aarch64.tar.gz"
    sha256 "9c89f74ed6dd3e63abbb31b46da3742cdbc43f29c231174e025709d9d0147190"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/zoom-autostatus/releases/download/v#{version}/zoom-autostatus-Darwin-x86_64.tar.gz"
    sha256 "91e3f00007ccb644a19351376f9cf8e98f7bff0e4567e94664c4375b7f69ddb8"
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
