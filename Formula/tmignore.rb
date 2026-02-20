class Tmignore < Formula
  desc "Exclude developer dependency directories and arbitrary paths from macOS backups"
  homepage "https://github.com/wassimk/tmignore"
  version "0.1.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/tmignore/releases/download/v#{version}/tmignore-Darwin-aarch64.tar.gz"
    sha256 "2be7400a9c7a8e25e9715120b7077d1fce579c9634453dbbefb8556a51ce46b9"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/tmignore/releases/download/v#{version}/tmignore-Darwin-x86_64.tar.gz"
    sha256 "d882854520f6869e45be40531074c2255da2931864714a9e991c6b31ece750d2"
  end

  def install
    bin.install "tmignore"
  end

  def caveats
    <<~EOS
      To start tmignore as a background service (runs every 24 hours):
        tmignore install

      To remove the background service:
        tmignore uninstall

      To generate a config file:
        tmignore init

      Config: ~/.config/tmignore/config.toml
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmignore --version")
  end
end
