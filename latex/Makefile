all: clean en elab
en: resume.tex
	latexmk -pdfxe resume.tex
zh: resume-zh.tex
	latexmk -pdfxe resume-zh.tex
elab: resume-elab.tex
	latexmk -pdfxe resume-elab.tex

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf *.cut *.fdb_latexmk *.fls *.xdv

clean-tex:
	$(RM) resume.tex resume-zh.tex resume-elab.tex
