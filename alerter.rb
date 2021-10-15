class Alerter < Formula
  desc "alerter is a command-line tool to send Mac OS X User Alerts (Notifications)"
  homepage "https://github.com/vjeantet/alerter"
  url "https://github.com/vjeantet/alerter/releases/download/002/alerter_v002_darwin_amd64.zip"
  sha256 "6a769ad29cc6908b936968ffb1030ee4ba1b33285071889767eeff9d13baec49"
  version '0.0.2'
  bottle :unneeded

  def install
    bin.install "alerter"
  end
end
