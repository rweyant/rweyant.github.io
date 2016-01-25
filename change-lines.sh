#!/bin/sh

FILES=""

#"feature: sample-image-5.jpg"
for f in ~/Documents/code/minimal-mistakes/_posts/*md
do
	echo "Processing $f"
	sed 's/```python/{% highlight python %}/g' $f > tmp1.md
	sed 's/```r/{% highlight r %}/g' tmp1.md > tmp2.md
	sed 's/```/{% endhighlight %}/g' tmp2.md > tmp3.md
	mv tmp3.md $f
	rm tmp1.md tmp2.md
done