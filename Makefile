file = cp1718t

pdf: $(file).tex
	pdflatex $(file).tex

bib: 
	bibtex $(file)

all: $(file).tex
	lhs2TeX $(file).lhs > $(file).tex
	pdflatex $(file).tex
	#bibtex $(file)
	#pdflatex $(file).tex
	#pdflatex $(file).tex

# Automatically compile what is necessary, as many times as needed.
.PHONY : rubber
rubber :
	@rubber --pdf -f $(file)

clean:
	rm -rf *.aux *.log *.bbl *.bak *.ptb *.blg *.out *.spl 

clean2: 
	rm -rf *.aux *.log *.bbl *.bak *.ptb *.blg *.out *.spl *.o *.hi *.idx *.tex

cleanall : clean
	rm $(file).pdf

latex:
	lhs2TeX cp1718t.lhs > cp1718t.tex
	pdflatex cp1718t.tex

