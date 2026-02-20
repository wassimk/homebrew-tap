class ElgatoAutolight < Formula
  desc "Automatically toggle Elgato lights when your Mac camera activates"
  homepage "https://github.com/wassimk/elgato-autolight"
  version "0.2.0"
  license "MIT"

  depends_on "wassimk/tap/elgato-light"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/elgato-autolight/releases/download/v#{version}/elgato-autolight-Darwin-aarch64.tar.gz"
    sha256 "df99673679b309605369429c596eff6e0c526acbb3232296b1fbed800d0f3b53"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/elgato-autolight/releases/download/v#{version}/elgato-autolight-Darwin-x86_64.tar.gz"
    sha256 "fdf3792b45b2536996f5c0f03366d8d62fe5e4484debea596b16791a8e41417f"
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
