class Vim < Formula
  # adapted based on: https://github.com/Homebrew/homebrew-core/blob/35fd17b43cab58504817b2d8d276b3c413d92904/Formula/vim.rb
  desc "Vi 'workalike' with many additional features"
  homepage "https://www.vim.org/"
  # vim should only be updated every 50 releases on multiples of 50
  url "https://github.com/vim/vim/archive/v8.1.1600.tar.gz"
  sha256 "4c73c88a164a74c57c7efad891e461edfc55d8dfe7f70b95c101abfe54eec3a4"
  head "https://github.com/vim/vim.git"

  LANGUAGES_OPTIONAL = %w[lua ruby perl].freeze

  depends_on "gettext"
  depends_on "python" => :recommended
  depends_on "lua" => :optional
  depends_on "ruby" => :optional
  depends_on "perl" => :optional

  conflicts_with "ex-vi",
                 :because => "vim and ex-vi both install bin/ex and bin/view"

  conflicts_with "macvim",
                 :because => "vim and macvim both install vi* binaries"

  def install
    ENV.prepend_path "PATH", Formula["python"].opt_libexec/"bin"

    # https://github.com/Homebrew/homebrew-core/pull/1046
    ENV.delete("SDKROOT")

    # vim doesn't require any Python package, unset PYTHONPATH.
    ENV.delete("PYTHONPATH")

    opts = []
    opts << "--enable-python3interp" if build.with?("python")
    LANGUAGES_OPTIONAL.each do |language|
      opts << "--enable-#{language}interp" if build.with? language
      if language.eql?("lua") && build.with?("lua")
        opts << "--with-lua-prefix=#{Formula["lua"].opt_prefix}"
      end
    end

    # We specify HOMEBREW_PREFIX as the prefix to make vim look in the
    # the right place (HOMEBREW_PREFIX/share/vim/{vimrc,vimfiles}) for
    # system vimscript files. We specify the normal installation prefix
    # when calling "make install".
    # Homebrew will use the first suitable Perl & Ruby in your PATH if you
    # build from source. Please don't attempt to hardcode either.
    system "./configure", "--prefix=#{HOMEBREW_PREFIX}",
           "--mandir=#{man}",
           "--enable-multibyte",
           "--with-tlib=ncurses",
           "--enable-cscope",
           "--enable-terminal",
           "--with-compiledby=Homebrew",
           "--enable-gui=no",
           "--without-x",
           *opts
    system "make"
    # Parallel install could miss some symlinks
    # https://github.com/vim/vim/issues/1031
    ENV.deparallelize
    # If stripping the binaries is enabled, vim will segfault with
    # statically-linked interpreters like ruby
    # https://github.com/vim/vim/issues/114
    system "make", "install", "prefix=#{prefix}", "STRIP=#{which "true"}"
    bin.install_symlink "vim" => "vi"
  end

  test do
    if build.with? "python3"
      (testpath/"commands.vim").write <<~EOS
        :python3 import vim; vim.current.buffer[0] = 'hello python3'
        :wq
      EOS
      system bin/"vim", "-T", "dumb", "-s", "commands.vim", "test.txt"
      assert_equal "hello python3", File.read("test.txt").chomp
    end
    assert_match "+gettext", shell_output("#{bin}/vim --version")
  end
end
