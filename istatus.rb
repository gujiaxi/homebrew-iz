class Istatus < Formula
  desc "A gadget to show system information of macOS."
  homepage "https://github.com/gujiaxi/iStatus"
  url "https://github.com/gujiaxi/iStatus/archive/v0.1.tar.gz"
  version "0.1"
  sha256 "ea1ced5bf2987496a3593d8215ec0d669afacd698ce7140cf6252a7f2c8b7eac"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/istatus"
  end
end
