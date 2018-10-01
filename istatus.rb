class Istatus < Formula
  desc "A gadget to show system information of macOS."
  homepage "https://github.com/gujiaxi/iStatus"
  url "https://github.com/gujiaxi/iStatus/archive/v0.4.tar.gz"
  version "0.4"
  sha256 "32a1c5ffbbed48949316dd1ec86e32cfa9740e5113b40dc469632062a732d106"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/istatus"
  end
end
