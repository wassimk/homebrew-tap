class CalendarAutoblock < Formula
  desc "Block time on your work Google Calendar when personal appointments fall during your work day"
  homepage "https://github.com/wassimk/calendar-autoblock"
  version "0.2.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/wassimk/calendar-autoblock/releases/download/v#{version}/calendar-autoblock-Darwin-aarch64.tar.gz"
    sha256 "7cc09f4ab3890ee81c7545a1c393e4d1e544bf0df68dd36d3ec660ba602ac06d"
  elsif Hardware::CPU.intel?
    url "https://github.com/wassimk/calendar-autoblock/releases/download/v#{version}/calendar-autoblock-Darwin-x86_64.tar.gz"
    sha256 "ebed11369b9811153d2d3b92075b6825b422028ad25acf4747e37f18a1a5e4c2"
  end

  def install
    bin.install "calendar-autoblock"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/calendar-autoblock --version")
  end
end
