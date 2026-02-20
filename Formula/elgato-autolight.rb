class ElgatoAutolight < Formula
  desc "Automatically toggle Elgato lights when your Mac camera activates"
  homepage "https://github.com/wassimk/elgato-autolight"
  version "0.1.0"
  license "MIT"

  depends_on "wassimk/tap/elgato-light"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/elgato-autolight/releases/download/v#{version}/elgato-autolight-Darwin-aarch64.tar.gz"
    sha256 "84ed051d175f5755bf4ea2036220d3e366ded5fb2b9afa59909edfed4d5bbbb0"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/elgato-autolight/releases/download/v#{version}/elgato-autolight-Darwin-x86_64.tar.gz"
    sha256 "b95601b07bf9da1119020974fd67a9b41f66b666609ec3ae22e6f9df863ff231"
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
