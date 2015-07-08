# Custom Tmux formula to install with patch to exit copy-mode when scrolling below bottom.

require 'formula'

class Tmux < Formula
  version "2.1"
  homepage 'http://tmux.sourceforge.net'
  url 'https://github.com/tmux/tmux.git', using: :git
  patch do
    url "https://github.com/dv/tmux/commit/19448c5a17f6a44ad52a2858fd40acd4b4e5aeed.patch"
    sha256 "f8f4358cecbc99161640b7db008ef93510267c9fb927064679bd9220df8521e6"
  end

  depends_on "autoconf"   => :build
  depends_on "automake"   => :build
  depends_on "libtool"    => :build
  depends_on "pkg-config" => :build
  depends_on "libevent"

  def install
    system "sh", "autogen.sh"

    ENV.append "LDFLAGS", '-lresolv'
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--sysconfdir=#{etc}"
    system "make install"

    bash_completion.install "examples/bash_completion_tmux.sh" => 'tmux'
    (share/'tmux').install "examples"
  end

  def caveats; <<-EOS.undent
    Example configurations have been installed to:
      #{share}/tmux/examples
    EOS
  end

  test do
    system "#{bin}/tmux", "-V"
  end
end
