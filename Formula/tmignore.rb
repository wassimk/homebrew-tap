class Tmignore < Formula
  desc "Exclude developer dependency directories and arbitrary paths from macOS backups"
  homepage "https://github.com/wassimk/tmignore"
  version "0.1.3"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/tmignore/releases/download/v#{version}/tmignore-Darwin-aarch64.tar.gz"
    sha256 "8a3ea95cac6f509541a8ee4662e7f34fe2f64dad4185f451b3211cc8d2ac29cd"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/tmignore/releases/download/v#{version}/tmignore-Darwin-x86_64.tar.gz"
    sha256 "b9e103fceba1ff7dd64b5cdf82bac6925ee6d1ffa7e26569293437f41b43a4a1"
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
