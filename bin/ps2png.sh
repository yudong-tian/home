# $Id: ps2pdf2png.sh,v 1.2 2010/11/26 17:01:53 ytian Exp ytian $
# if ps files are given in command line, convert them. Otherwise, convert all
# ps files found in cwd. 

if [ $# -eq 0 ]; then
  files=*.ps
else
  files=$@
fi

for file in $files; do
  stem=${file%.*}
  #ps2pdf ${stem}.ps ${stem}.pdf
  gs -dBATCH -q -dNOPAUSE -sDEVICE=png16m -sOutputFile=${stem}.png -r400x400 ${file}
  gs -dBATCH -q -dNOPAUSE -sDEVICE=png16m -sOutputFile=${stem}-sm.png  ${file}
  convert -rotate 90 ${stem}.png ${stem}-r90.png
  convert -rotate 90 ${stem}-sm.png ${stem}-r90-sm.png
done


