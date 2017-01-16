# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Ydcv < Formula
  desc "YouDao Console Version - Simple wrapper for Youdao online translate (Chinese <-> English) service API, as an alternative to the StarDict Console Version(sdcv)."
  homepage "https://github.com/felixonmars/ydcv"
  url "https://github.com/felixonmars/ydcv/archive/0.4.tar.gz"
  sha256 "2d9f6309bbf2d35c0c34c5ee945cf40769cc8201e6f374fa2a4f2d4b827fbdbb"
  head "https://github.com/felixonmars/ydcv", :using => :git

  depends_on :python => :recommended
  depends_on :python3 => :opional

  def install
    bin.install "ydcv.py"
    bin.install_symlink "ydcv.py" => "ydcv"
  end

  test do
    system "true"
  end
end
