class KeyTools < Formula
  desc "Musical key analysis tools"
  homepage 'http://www.pogo.org.uk/~mark/key-tools/'
  head "https://www.pogo.org.uk/~mark/key-tools.git", branch: "master"
  license "GPL-3.0"
  version '0.1'

  depends_on "fftw"
  depends_on "sox"
  depends_on "id3v2"

  patch :DATA

  def install
    system "make"
    bin.install "key"
    bin.install "key-tag"
  end
end

__END__
--- a/key-tag
+++ b/key-tag
@@ -65,7 +65,7 @@ case "$FILE" in
 	KEY=`metaflac --show-tag=KEY "$FILE" | sed -e 's/KEY=//'`
 	;;
 *.mp3)
-	KEY=`id3v2 -R "$FILE" | sed -n 's/^TKEY.*: \([0-9\.]\+\)/\1/p'`
+	KEY=`id3v2 -l "$FILE" | sed -En 's/^TKEY.*: ([0-9\.]+)/\1/p'`
 	;;
 *.ogg)
 	KEY=`vorbiscomment "$FILE" | sed -n 's/^KEY=//p'`
