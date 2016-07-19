
files=`ls *.png |grep -v '^trim-'`
for png in $files; do 
   convert -trim $png trim-$png
done
