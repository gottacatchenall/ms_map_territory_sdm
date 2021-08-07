#! /usr/bin/sh

FIGNAME="probdensity"

echo $FIGNAME
pdflatex $FIGNAME.tex
convert -density 600x600 $FIGNAME.pdf -quality 90 $FIGNAME.png
rm $FIGNAME.aux $FIGNAME.pdf
