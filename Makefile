ALLPDFS := $(patsubst %.md,%.pdf,$(wildcard *.md))
PDFS := $(filter-out readme.pdf, $(ALLPDFS))

all: $(PDFS)

%.pdf: %.md template.tex
	pandoc --template=template.tex $< -o $@

template.tex:
	@echo "Missing template.tex"
	@false

clean:
	rm $(PDFS)

rebuild: clean all
