class Istatus < Formula
  desc "A gadget to show system information of macOS."
  homepage "https://github.com/gujiaxi/iStatus"
  url "https://github.com/gujiaxi/iStatus/archive/master.zip"
  version "0.1"
  sha256 "2b942db188d989945e3cff600fca587fb63a30068118e5d653b7033ad3405635"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/istatus"
  end
end
