class Tmignore < Formula
  desc "Exclude developer dependency directories and arbitrary paths from macOS backups"
  homepage "https://github.com/wassimk/tmignore"
  version "0.1.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/tmignore/releases/download/v#{version}/tmignore-Darwin-aarch64.tar.gz"
    sha256 "553b2398bedd98bc5237ace5e0a82328794f793a96b0b9b97b7ae7908c9b8b8e"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/tmignore/releases/download/v#{version}/tmignore-Darwin-x86_64.tar.gz"
    sha256 "faa1b21583f775aebfc028836b685a0a69ea72a84de293d123e84728d3dfe680"
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
