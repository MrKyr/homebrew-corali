class OsxCpuTemp < Formula
  desc "Outputs current CPU temperature for OSX."
  homepage "https://github.com/lavoiesl/osx-cpu-temp"
  url "https://github.com/lavoiesl/osx-cpu-temp/archive/master.zip"
  sha256 "c5a13d93eddbf5df82a688dbff8a9802f60cf10bc1d7a4b7a3661aa6d344f2ef"
  version '1.1.0'
  bottle :unneeded

  def install
    system "make"
    bin.install "osx-cpu-temp"
  end
end
