class ElgatoLight < Formula
  desc "CLI to control Elgato Key Light and Key Light Air devices"
  homepage "https://github.com/wassimk/elgato-light"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Darwin-aarch64.tar.gz"
      sha256 "aa90b2cb9cdc970c311ec3d7a764b70f2dc637696c98e024bb6711d4da2d86cb"
    elsif Hardware::CPU.intel?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Darwin-x86_64.tar.gz"
      sha256 "f39f154b3ffc210e4886cfc78bf8ea0e74f07595cb79df5d67451e7950897513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Linux-aarch64.tar.gz"
      sha256 "5d62adb191d3d79b2abad196885259d9c60b31ee80835862a0e45b83a13749dc"
    elsif Hardware::CPU.intel?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Linux-x86_64.tar.gz"
      sha256 "58e33606abb693f6d2ba6461585526711ec3f14efd865070da002d7f0772664d"
    end
  end

  def install
    bin.install "elgato-light"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/elgato-light --version")
  end
end
