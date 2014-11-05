MDS := $(filter-out readme.md, $(wildcard *.md))
PDFS := $(patsubst %.md,%.pdf, $(MDS))
TEX := $(patsubst %.md,%.tex, $(MDS))

all: $(PDFS)

%.pdf: %.md template.tex
	pandoc --template=template.tex $< -o $@

template.tex:
	@echo "Missing template.tex"
	@false

clean:
	rm $(PDFS)

rebuild: clean all

# For debugging errors in tex
%.tex: %.md template.tex
	pandoc --template=template.tex $< -o $@

tex: $(TEX)
