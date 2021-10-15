class Webkit2png < Formula
  desc "Create screenshots of webpages from the terminal"
  homepage "http://www.paulhammond.org/webkit2png/"
  url "https://github.com/paulhammond/webkit2png/archive/v0.7.tar.gz"
  sha256 "9b810edb6f54cc23ba86b0212f203e6c3bbafc3cbdb62b9c33887548c91015bf"

  bottle :unneeded

  patch :p0, :DATA

  def install
    bin.install "webkit2png"
  end
end

__END__
--- webkit2png	2014-05-18 03:12:03.000000000 +0300
+++ webkit2png.patched	2016-09-17 13:50:21.000000000 +0300
@@ -421,6 +421,10 @@
 
     app = AppKit.NSApplication.sharedApplication()
 
+    # Handles ATS HTTPS requirement introduced in Mac El Capitan
+    if options.ignore_ssl_check:
+        AppKit.NSBundle.mainBundle().infoDictionary()['NSAppTransportSecurity'] = dict(NSAllowsArbitraryLoads = True)
+
     # create an app delegate
     delegate = AppDelegate.alloc().init()
     delegate.timeout = options.timeout

