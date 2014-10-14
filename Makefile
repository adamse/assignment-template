PDFS := $(patsubst %.md,%.pdf, $(filter-out readme.md, $(wildcard *.md)))

all: $(PDFS)

%.pdf: %.md template.tex
	pandoc --template=template.tex $< -o $@

template.tex:
	@echo "Missing template.tex"
	@false

clean:
	rm $(PDFS)

rebuild: clean all
