
REPORT=proposal
SUMMARY=summary
BODY=body
REFERENCES=references

LATEX=pdflatex
LATEX2=latex
BIBTEX=bibtex

SRCS=$(wildcard *.tex)
REFS=$(wildcard *.bib)
FIGS=$(wildcard figures/*)

all: $(REPORT).pdf

body: $(BODY).pdf

refs: $(REFERENCES).pdf

summary: $(SUMMARY).pdf

$(REPORT).pdf: $(SRCS) $(REFS) $(FIGS)
	$(LATEX) $(REPORT)
	$(BIBTEX) $(REPORT)
	$(LATEX) $(REPORT)
	$(LATEX) $(REPORT)

$(SUMMARY).pdf: summary.tex
	$(LATEX) $(REPORT)
	$(LATEX) $(REPORT)
	mv $(REPORT).pdf $(SUMMARY).pdf

$(BODY).pdf: $(SRCS) $(FIGS)
	$(LATEX) $(REPORT)
	mv $(REPORT).pdf $(BODY).pdf

$(REFERENCES).pdf: $(REFERENCES).tex
	$(LATEX) $(REFERENCES)

clean:
	rm -f *.dvi *.aux *.log *.blg *.bbl *.toc *.synctex.gz *.fdb_latexmk *.fls $(REPORT).out $(REPORT).ps $(REPORT).pdf $(REFERENCES).pdf $(BODY).pdf
