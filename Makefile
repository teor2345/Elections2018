# Simple markdown makefile

%.html: %.md
	kramdown -i GFM -o html $< > $@

%.pdf: %.md
	kramdown -i GFM -o pdf $< > $@
