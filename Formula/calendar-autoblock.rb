class CalendarAutoblock < Formula
  desc "Block time on your work Google Calendar when personal appointments fall during your work day"
  homepage "https://github.com/wassimk/calendar-autoblock"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/calendar-autoblock/releases/download/v#{version}/calendar-autoblock-Darwin-aarch64.tar.gz"
    sha256 "13e9aee1b7fac62bac8c73ec1d6b1a1d4d536942412141a485328c8a9a73f5af"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/calendar-autoblock/releases/download/v#{version}/calendar-autoblock-Darwin-x86_64.tar.gz"
    sha256 "cbb47813d1b691e1fca241538c5eebafc076ff43360728f9188c94f47acf132b"
  end

  def install
    bin.install "calendar-autoblock"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/calendar-autoblock --version")
  end
end
