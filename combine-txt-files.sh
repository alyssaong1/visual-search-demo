#!/bin/bash

#mkdir final
mkdir sed_done

files=*.txt

for f in $files
do
  echo "Processing $f file..."
  sed -z 's/\n/,/g' $f > sed_done/$f
  tempfile="${f##*/}"
  filename="${tempfile%.*}"
  #find sed_done/$f -type f | xargs -I $f sed "s|^|$filename,|g" $f > final/$f
done
#cat final/*.txt > all_result.txt

#awk '1' final/*.txt > all_results.txt

find sed_done/ -type f -exec basename \{\} .txt \; > filenames.txt

#new change
awk '1' sed_done/*.txt > all_results.txt
