class SNail < Formula
  desc "An extended POSIX mailx(1) (moved to www.sdaoden.eu/code.html)"
  homepage "https://sourceforge.net/projects/s-nail/"
  url "https://www.sdaoden.eu/downloads/s-nail-14.8.10.tar.gz"
  sha256 "8ed6c1934cd2f21a3775054dc0ade809b237b8a2c09421fad33727a70433f0a9"
  version '14.8.10'

  def install
    system 'make config'
    system 'make'
    bin.install 's-nail' => 'mailxx'
  end
end
