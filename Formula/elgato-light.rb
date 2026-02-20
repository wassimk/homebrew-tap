class ElgatoLight < Formula
  desc "CLI to control Elgato Key Light and Key Light Air devices"
  homepage "https://github.com/wassimk/elgato-light"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Darwin-aarch64.tar.gz"
      sha256 "749ef4851b8612f3ac951ebf4f01581cdd2e5bd1609a9e5f742a13d55398cbe6"
    elsif Hardware::CPU.intel?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Darwin-x86_64.tar.gz"
      sha256 "0a55ccf18c64e8dc51812ac28884a35cee13fcb31e1a0920fe41445ba754c936"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Linux-aarch64.tar.gz"
      sha256 "c625cd5ee8dbb1bc7902b3dacb5d516c2099573f02cccefccc5af3ab79415300"
    elsif Hardware::CPU.intel?
      url "https://github.com/wassimk/elgato-light/releases/download/v#{version}/elgato-light-Linux-x86_64.tar.gz"
      sha256 "c76f9d089e5ca486c8fe2ffd5c9a31fe8a3f8445997276a9899f639a95db77a8"
    end
  end

  def install
    bin.install "elgato-light"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/elgato-light --version")
  end
end
