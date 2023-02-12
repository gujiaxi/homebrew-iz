class Isync < Formula
  desc "Synchronize a maildir with an IMAP server"
  homepage "https://isync.sourceforge.io/"
  revision 1
  head "https://git.code.sf.net/p/isync/isync.git"

  stable do
    url "https://downloads.sourceforge.net/project/isync/isync/1.3.1/isync-1.3.1.tar.gz"
    sha256 "68cb4643d58152097f01c9b3abead7d7d4c9563183d72f3c2a31d22bc168f0ea"
    # Patch to fix detection of OpenSSL 1.1
    # https://sourceforge.net/p/isync/bugs/51/
    patch :DATA
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "openssl@1.1"
  depends_on "berkeley-db" => :optional

  def install
    # Regenerated for HEAD, and because of our patch
    if build.head?
      system "./autogen.sh"
    else
      system "autoreconf", "-fiv"
    end

    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --disable-silent-rules
    ]

    args << "ac_cv_berkdb4=no" if build.without?("berkeley-db")

    system "./configure", *args
    system "make", "install"
  end

  service do
    run [opt_bin/"mbsync", "-a"]
    run_type :interval
    interval 300
    keep_alive false
    environment_variables PATH: std_service_path_env
    log_path "/dev/null"
    error_log_path "/dev/null"
  end

  test do
    system bin/"mbsync-get-cert", "duckduckgo.com:443"
  end
end
