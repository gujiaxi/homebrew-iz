class Libmobi < Formula
  desc "C library for handling Kindle (MOBI) formats of ebook documents"
  homepage "https://github.com/bfabiszewski/libmobi"
  url "https://github.com/bfabiszewski/libmobi/archive/v0.3.tar.gz"
  sha256 "2146edd490acfa03e58bc81f5d4de610b07729a3e8fdc327df360cbf319bbd86"

  def install
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make"
    system "make", "install"
  end

  test do
    system "mobitool -v"
  end
end
