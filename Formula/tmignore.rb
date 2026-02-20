class Tmignore < Formula
  desc "Exclude developer dependency directories and arbitrary paths from macOS backups"
  homepage "https://github.com/wassimk/tmignore"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/tmignore/releases/download/v#{version}/tmignore-Darwin-aarch64.tar.gz"
    sha256 "23d3b806cc551655fb0365d6ad052e6bc4605c33684b02ea9ac7711570c49c75"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/tmignore/releases/download/v#{version}/tmignore-Darwin-x86_64.tar.gz"
    sha256 "fffd4d4e464aaeaee63c8f20fed7c8855e22a80081ee61a6d671d37cf10aabe0"
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
