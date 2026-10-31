class ElgatoAutolight < Formula
  desc "Automatically toggle Elgato lights when your Mac camera activates"
  homepage "https://github.com/wassimk/elgato-autolight"
  version "0.2.1"
  license "MIT"

  depends_on "wassimk/tap/elgato-light"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/elgato-autolight/releases/download/v#{version}/elgato-autolight-Darwin-aarch64.tar.gz"
    sha256 "b9687dd3c59e79d351915756ab5fabc8f54fb67b01e0d40eb5344f13e96241eb"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/elgato-autolight/releases/download/v#{version}/elgato-autolight-Darwin-x86_64.tar.gz"
    sha256 "8cca08cf650150409d2429791bfd285733335c32a916f5824527864009570ca9"
  end

  def install
    bin.install "elgato-autolight"
  end

  def caveats
    <<~EOS
      To start elgato-autolight as a background service, run:
        elgato-autolight install

      To remove the background service:
        elgato-autolight uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/elgato-autolight --version")
  end
end
