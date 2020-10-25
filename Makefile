SRCS := $(wildcard images/*.svg)
OBJS := $(patsubst %.svg,%.png,$(SRCS))

recettes.pdf: recettes.md $(OBJS)
	pandoc recettes.md -s --highlight-style zenburn -o recettes.pdf -H disable_float.tex --table-of-content 
	# --top-level-division=chapter

clean:
	rm -rf *.html *.pdf images/*.png

%.png: %.svg
	@inkscape -z -e $@ $< > /dev/null