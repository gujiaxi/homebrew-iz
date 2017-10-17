class Istatus < Formula
  desc "A gadget to show system information of macOS."
  homepage "https://github.com/gujiaxi/iStatus"
  url "https://github.com/gujiaxi/iStatus/archive/v0.3.tar.gz"
  version "0.3"
  sha256 "ad6d9109595dff347420d578202e393b97573d97dc007761f7ff8e1836d479d0"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/istatus"
  end
end
