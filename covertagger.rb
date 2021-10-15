class Covertagger < Formula
  desc "This is a simple application that will try to find a album art image (png or jpg) and add it directly into the metadata of all your mp3 files"
  homepage 'http://www.musaraigne.net/covertagger'
  head 'https://svn.code.sf.net/p/covertagger/code/'
  version '1.0.1'

  depends_on 'taglib' #=> :build
  depends_on 'openssl' #=> :build

  patch :DATA

  def install
    system "make"
    bin.install 'covertagger'
  end
end

__END__
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 VERSION=1.0
 
 all:
-	g++ -O2 -o covertagger covertagger.cpp `taglib-config --libs --cflags` -I/usr/include/openssl -lssl -DVERSION="\"$(VERSION)\""
+	g++ -O2 -o covertagger covertagger.cpp `taglib-config --libs --cflags` -I/usr/local/opt/openssl/include/openssl -I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib -lssl -lcrypto -DVERSION="\"$(VERSION)\""
 	
 dist:
 	tar -c covertagger.cpp Makefile README COPYING > covertagger-$(VERSION).tar
