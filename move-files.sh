#!/bin/sh

FILES=""
cd  ~/Documents/code/rweyant.github.io/_source/
#"feature: sample-image-5.jpg"
for f in `ls *Rmd`
do
	echo "Processing $f"
	mv $f 2016-01-26-$f
done
cd  ~/Documents/code/rweyant.github.io/