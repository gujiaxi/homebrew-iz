class Libmobi < Formula
  desc "C library for handling Kindle (MOBI) formats of ebook documents"
  homepage "https://github.com/bfabiszewski/libmobi"
  url "https://github.com/gujiaxi/libmobi/archive/v0.4.tar.gz"
  version "0.4"
  sha256 "eb7f37f5d5c322a37ed9352c9284acf8c0cd86185309535d3fd09b0fc7cb3ea3"

  bottle do
    root_url "https://github.com/gujiaxi/homebrew-iz/raw/master/bottles"
    cellar :any_skip_relocation
    sha256 "ef75907890114af4d9343bff7e496ed93cc774718f27ce2b47288a30e35187f0" => :sierra
    sha256 "003978a483ab9abedb12b073ffb0b8603539d47efeb407059db026e294588e0a" => :el_capitan
    sha256 "3fb38b9f0a97b7ab5248c46b3ba739077e908669eb72e8ec4e46062a7e2c8a91" => :yosemite
  end

  depends_on "automake" => :build

  def install
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
    system "make"
    system "make", "install"
  end

  test do
    system "mobitool -v"
  end
end
