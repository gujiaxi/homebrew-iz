class Istatus < Formula
  desc "A CLI tool to show system information of macOS."
  homepage "https://github.com/gujiaxi/iStatus"
  url "https://github.com/gujiaxi/iStatus/archive/v0.5.tar.gz"
  version "0.5"
  sha256 "1c22e9f2b4cde65e0a41c6a3bcdb958835a70ccadc8cb9c638f9c9cb626f3f52"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/istatus"
  end
end
