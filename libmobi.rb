class Libmobi < Formula
  desc "C library for handling Kindle (MOBI) formats of ebook documents"
  homepage "https://github.com/bfabiszewski/libmobi"
  url "https://github.com/gujiaxi/libmobi/archive/v0.4.tar.gz"
  version "0.4"
  sha256 "eb7f37f5d5c322a37ed9352c9284acf8c0cd86185309535d3fd09b0fc7cb3ea3"

  bottle do
    root_url "https://github.com/gujiaxi/homebrew-iz/raw/master/bottles"
    cellar :any_skip_relocation
    sha256 "5be571fbfbf68a3cba88a59b1e086bf5ac1f7120d36d3706097e877178dd3cf8" => :sierra
    sha256 "5be571fbfbf68a3cba88a59b1e086bf5ac1f7120d36d3706097e877178dd3cf8" => :el_capitan
    sha256 "5be571fbfbf68a3cba88a59b1e086bf5ac1f7120d36d3706097e877178dd3cf8" => :yosemite
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
