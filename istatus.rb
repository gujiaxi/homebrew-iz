class Istatus < Formula
  desc "A gadget to show system information of macOS."
  homepage "https://github.com/gujiaxi/iStatus"
  url "https://github.com/gujiaxi/iStatus/archive/v0.4.tar.gz"
  version "0.4"
  sha256 "47c88efdb743f73fbc08c7386552f7cf5544aac5bf90967a123cf2018c2fe342"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/istatus"
  end
end
