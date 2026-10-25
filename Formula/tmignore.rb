class Tmignore < Formula
  desc "Exclude developer dependency directories and arbitrary paths from macOS backups"
  homepage "https://github.com/wassimk/tmignore"
  version "0.1.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/tmignore/releases/download/v#{version}/tmignore-Darwin-aarch64.tar.gz"
    sha256 "7ba9bd910403151aaa56f4de22fc3fb7d0f395ea542358b49157e4c748fe0df4"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/tmignore/releases/download/v#{version}/tmignore-Darwin-x86_64.tar.gz"
    sha256 "578bc8291ea076d153390d2e866bf73995d416e685a1a08fcc435d085e3d6f9d"
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
