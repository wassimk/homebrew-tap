class ZoomAutostatus < Formula
  desc "Automatically set your Slack status while you're in a Zoom meeting"
  homepage "https://github.com/wassimk/zoom-autostatus"
  version "0.1.0"
  license "MIT"

  depends_on "wassimk/tap/st"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/zoom-autostatus/releases/download/v#{version}/zoom-autostatus-Darwin-aarch64.tar.gz"
    sha256 "022d666e177f357e2839a03a9bfd087ecdb4c1bca6d202a7bd7cc0ad8dd6a563"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/zoom-autostatus/releases/download/v#{version}/zoom-autostatus-Darwin-x86_64.tar.gz"
    sha256 "89d837546c6cdc6f73952736b70c75ba4560ddd42a8f0e9d8296b54b5737d2ee"
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
