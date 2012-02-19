#!/bin/sh

echo
echo "Start creating PDF file"
echo

pdflatex -file-line-error -draftmode main.tex

echo
echo "Creating main.bbl"
echo

bibtex main.aux

echo
echo "Running again for table of contents, bibliography, references, etc."
echo

pdflatex -file-line-error -draftmode main.tex

echo
echo "Final creation"
echo

pdflatex -file-line-error main.tex

echo
echo "Cleaning directories"
echo

rm -rv *.aux
rm -rv chapters/*.aux
rm -rv *.log
rm -rv *.toc
rm -rv *.bbl
rm -rv *.blg
rm -rv *.out

echo
echo "Renaming main.pdf to Document.pdf"
mv main.pdf Document.pdf
