
MKD = $(sort $(wildcard *.md))
HTML = $(patsubst %.md, public_html/%.html, $(MKD))

.PHONY: all

all: $(HTML)

public_html/%.html: %.md template.html
	@echo pandoc $< -o $@
	@pandoc \
		--smart \
		--standalone \
		--template=template.html \
		$< -o $@
