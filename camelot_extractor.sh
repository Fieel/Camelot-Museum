#!/bin/bash
#
# @uthor: Filipe Madureira
#
# Given a scan image with transparent background proceed to cut
# single cards and output them as single separate files. 
#


#Replace bg color with transparent alpha channel
#bash ./mktrans -A $1

#Add 1 pixel transparent border and make sure all color under the transparency is white:
convert input_alpha.png -bordercolor none -border 1 -background white -alpha background -bordercolor white cards_border.png

#Threshold to black and white
convert cards_border.png -alpha off -negate -threshold 0 -type bilevel cards_white_t0.png

#Run connected components labeling to extract the bounds of the white thresholded cards
#and crop the white background image to extract the cards
OLD_IFS=$IFS
IFS=$'\n'
arr=(`convert cards_white_t0.png \
-define connected-components:verbose=true \
-define connected-components:area-threshold=10 \
-define connected-components:mean-color=true \
-connected-components 8 \
null: | tail -n +2 | sed 's/^[ ]*//'`)
IFS=$OLD_IFS
num=${#arr[*]}
for ((i=0; i<num; i++))
do
	bbox=`echo "${arr[$i]}" | cut -d\  -f2`
	color=`echo "${arr[$i]}" | cut -d\  -f5`
	if [ "$color" = "gray(255)" ]; then
		convert cards_border.png -crop $bbox +repage -background none -deskew 40% cards_$i.png
	fi
done
