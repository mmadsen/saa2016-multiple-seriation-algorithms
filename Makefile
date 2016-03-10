.PHONY : clean

pdf:
	./knit pdf
	pandoc -s -S --biblio saa2016-seriation-multiple-approaches.bib saa2016-seriation-multiple-approaches.md --template=xelatex-template.tex --latex-engine=xelatex -o saa2016-seriation-multiple-approaches.tex --natbib --number-sections --listings
	latexmk -pdf saa2016-seriation-multiple-approaches
	open -a /Applications/Skim.app saa2016-seriation-multiple-approaches.pdf

md:
	pandoc -s -S --biblio saa2016-seriation-multiple-approaches.bib saa2016-seriation-multiple-approaches.md -o saa2016-seriation-multiple-approaches.md

odt:
	./knit docx
	pandoc -s -S --biblio saa2016-seriation-multiple-approaches.bib saa2016-seriation-multiple-approaches.md --reference-odt=reference.odt -o saa2016-seriation-multiple-approaches.odt

epub:
	./knit epub
	pandoc -s -S --biblio saa2016-seriation-multiple-approaches.bib saa2016-seriation-multiple-approaches.md -o saa2016-seriation-multiple-approaches.epub


clean:
	latexmk -CA
	rm -rf *.log *.bbl *.blg *.out *.md  *.docx saa2016-seriation-multiple-approaches.tex *.epub saa2016*.md
