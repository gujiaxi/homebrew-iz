class Libmobi < Formula
  desc "C library for handling Kindle (MOBI) formats of ebook documents"
  homepage "https://github.com/bfabiszewski/libmobi"
  url "https://github.com/bfabiszewski/libmobi/archive/public.zip"
  version 0.3
  sha256 "dea42cdf3687204579a132029f64e0ea015c018a7a803562767b6c93323ff093"

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
