require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Ts < Formula
  desc "Queuing tasks for batch execution with Task Spooler. https://www.linux.com/news/queuing-tasks-batch-execution-task-spooler"
  homepage 'http://vicerveza.homeunix.net/~viric/soft/ts/'
  url 'http://vicerveza.homeunix.net/~viric/soft/ts/ts-0.7.3.tar.gz'
  version '0.7.3'
  sha1 '33b9321d4f48a2c2685a8240db4e00c0e69ef9bc'


  def install
    # ENV.j1  # if your formula's build system can't parallelize

#    system "./configure", "--disable-debug", "--disable-dependency-tracking",
#                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make"
#    prefix.install 'ts'
    bin.install 'ts'
#    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test ts`.
    system "false"
  end
end
