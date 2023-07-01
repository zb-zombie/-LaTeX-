.PHONY: all test release clean

common_deps := csustThesis.cls baseinfo.tex reference.bib
body_deps := body/*.tex
pdfs := thesis.pdf research_proposal.pdf task_book.pdf translation.pdf
tmp_files := *.aux *.bbl *.bcf *.blg *.lof *.log *.run.xml *.toc *.lot *.nav *.out *.snm *.toc

all: ${pdfs}

test: ${pdfs}

release: ${pdfs}
	mkdir -p release
	mv $^ release

thesis.pdf: thesis  # deprecated

thesis: thesis.tex ${common_deps} ${body_deps}
	xelatex thesis
	biber thesis
	xelatex thesis
	xelatex thesis

research_proposal.pdf: research_proposal  # deprecated

research_proposal: research_proposal.tex ${common_deps}
	xelatex research_proposal
	biber research_proposal
	xelatex research_proposal
	xelatex research_proposal

task_book.pdf: task_book  # deprecated

task_book: task_book.tex ${common_deps}
	xelatex task_book
	biber task_book
	xelatex task_book
	xelatex task_book

translation.pdf: translation  # deprecated

translation: translation.tex ${common_deps}
	xelatex translation
	biber translation
	xelatex translation
	xelatex translation

clean:
	-rm -f ${tmp_files}
	-cd body && rm -f ${tmp_files}
	-rm -rf release
