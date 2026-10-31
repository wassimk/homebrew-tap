class ElgatoLight < Formula
  desc "CLI to control Elgato Key Light and Key Light Air devices"
  homepage "https://github.com/wassimk/elgato-light"
  version "1.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Darwin-aarch64.tar.gz"
      sha256 "b0fced459e59bbcb7f778fd41109384c05b2eb0d34cd11c8e79b280705a81e51"
    elsif Hardware::CPU.intel?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Darwin-x86_64.tar.gz"
      sha256 "3a3052e7320e281617bced57d12099b1572f3abe02f85b516f565d1e0df63613"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Linux-aarch64.tar.gz"
      sha256 "c6277efe2808a6a075e9fc06ad36835a2b6db7dcf926f94a3eec9b751f6ed7e4"
    elsif Hardware::CPU.intel?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Linux-x86_64.tar.gz"
      sha256 "d76af54d7666609654c45f2de3f0f66b16213a7c00c705737c7acc94588b0ba9"
    end
  end

  def install
    bin.install "elgato-light"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/elgato-light --version")
  end
end
