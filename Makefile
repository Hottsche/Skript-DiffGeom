# LaTeX Makefile

MAIN = skript-diffgeom
MAKEINDEXSTYLE = index.ist

all: $(MAIN).tex
	pdflatex $(MAIN).tex
#	bibtex $(MAIN).aux
	makeindex -s $(MAKEINDEXSTYLE) "$(MAIN)"
	pdflatex $(MAIN).tex
