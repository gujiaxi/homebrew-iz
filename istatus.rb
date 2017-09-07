class Istatus < Formula
  desc "A gadget to show system information of macOS."
  homepage "https://github.com/gujiaxi/iStatus"
  url "https://github.com/gujiaxi/iStatus/archive/v0.2.tar.gz"
  version "0.2"
  sha256 "ba2cfdb6ce9bc7c5469752583c714ab4c005ff359c97c6c28b21c5d83c4d3a80"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/istatus"
  end
end
