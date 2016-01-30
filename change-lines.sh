#!/bin/sh

FILES=""

#"feature: sample-image-5.jpg"
for f in ~/Documents/code/rweyant.github.io/_source/_tmpstore/*md
do
	echo "Processing $f"
	sed 's/modified: 2013-05-31/modified: 2016-01-30/g' $f > tmp1.md
	sed "s#source('../../source/common_rmd_options.R')#source('~/Documents/code/bertplot/R/source/common_rmd_options.R')#g#" tmp1.md > tmp2.md
	mv tmp2.md $f
	rm tmp1.md
done