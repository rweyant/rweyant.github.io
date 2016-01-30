#!/bin/sh

FILES=""

#"feature: sample-image-5.jpg"
for f in ~/Documents/code/rweyant.github.io/_source/*Rmd
do
	echo "Processing $f"
	sed 's/<a href="#top">Back to top<\/a>//g' $f > tmp1.md
	#sed "s#source('../../source/common_rmd_options.R')#source('~/Documents/code/bertplot/R/source/common_rmd_options.R')#g#" tmp1.md > tmp2.md
	mv tmp1.md $f
	#rm tmp1.md
done