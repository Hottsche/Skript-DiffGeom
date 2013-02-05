# LaTeX Makefile

latexmain = skript-diffgeom
MAKEINDEXSTYLE = index.ist

all: $(latexmain).pdf

$(latexmain).pdf: $(latexmain).tex vc.tex chapter/*.tex
	pdflatex $(latexmain).tex
	bibtex $(latexmain).aux
	makeindex -s $(MAKEINDEXSTYLE) "$(latexmain)"
	pdflatex $(latexmain).tex



vc.tex: .git/logs/HEAD
	echo "%%% This file is generated by Makefile." > vc.tex
	echo "%%% Do not edit this file!\n%%%" >> vc.tex
	git log -1 --format="format:\
		\\gdef\\GITAbrHash{%h}\
		\\gdef\\GITAuthorDate{%ad}\
		\\gdef\\GITAuthorName{%an}" >> vc.tex
	echo "\gdef\GITVersionTag{" >> vc.tex
	git describe --abbrev=0 --tags >> vc.tex
	echo "}" >> vc.tex

umlauts: chapter/*.tex
	find . -name "*.tex" | xargs sed -i 's/ä/"a/g'
	find . -name "*.tex" | xargs sed -i 's/ö/"o/g'
	find . -name "*.tex" | xargs sed -i 's/ü/"u/g'
	find . -name "*.tex" | xargs sed -i 's/Ä/"A/g'
	find . -name "*.tex" | xargs sed -i 's/Ö/"O/g'
	find . -name "*.tex" | xargs sed -i 's/Ü/"U/g'
	find . -name "*.tex" | xargs sed -i 's/ß/"s/g'
