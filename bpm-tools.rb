class BpmTools < Formula
  desc "Detect tempo of audio files using beats-per-minute (BPM)"
  homepage 'http://www.pogo.org.uk/~mark/bpm-tools/'
  head "https://www.pogo.org.uk/~mark/bpm-tools.git", branch: "master"
  license "GPL-2.0"
  version '0.3'

  option "with-bpm-graph", "Install plot generation script"
  option "with-bpm-tag", "Install audio file tagging script"

  depends_on "gnuplot" if build.with? "bpm-graph"

  if build.with? "bpm-tag"
    depends_on "sox"
    depends_on "id3v2"
    depends_on "flac"
    depends_on "vorbis-tools"
  end

  patch :DATA

  def install
    system "make"
    bin.install "bpm"
    bin.install "bpm-graph" if build.with? "bpm-graph"
    bin.install "bpm-tag" if build.with? "bpm-tag"
    man1.install "bpm.1"
    man1.install "bpm-graph.1" if build.with? "bpm-graph"
    man1.install "bpm-tag.1" if build.with? "bpm-tag"
  end
end

__END__
--- a/bpm-tag
+++ b/bpm-tag
@@ -88,7 +88,7 @@ case "$FILE" in
 	BPM=`metaflac --show-tag=BPM "$FILE" | sed -e 's/BPM=//'`
 	;;
 *.mp3)
-	BPM=`id3v2 -R "$FILE" | sed -n 's/^TBPM.*: \([0-9\.]\+\)/\1/p'`
+	BPM=`id3v2 -l "$FILE" | sed -En 's/^TBPM.*: ([0-9\.]+)/\1/p'`
 	;;
 *.ogg)
 	BPM=`vorbiscomment "$FILE" | sed -n 's/^BPM=//p'`
@@ -109,7 +109,7 @@ fi
 
 # Analyse the BPM
 
-BPM=`sox -V1 "$FILE" -r 44100 -e float -c 1 -t raw - | bpm $ARGS`
+BPM=`sox -V1 "$FILE" -r 44100 -e float -c 1 -t raw - | bpm -f "%.0f" $ARGS`
 if [ -z "$BPM" ]; then
 	exit 1
 fi
