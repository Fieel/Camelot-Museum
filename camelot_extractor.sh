#!/bin/bash
#
# @uthor: Filipe Madureira
#
# Given a scan image with transparent background proceed to cut
# single cards and output them as single separate files. 
#


# Aggiungere terzo parametro 'range', verrà usato per stampare le singole carte
# col nome appropriato in baso al caso (es. range=figure, i file di output 
# finiranno per _figure
if [ $# -ne 3 ]
then
	#Message in case not enough arguments are given
	echo ''
	#echo 'Not enough arguments!'
	#echo 'Usage:'
	#echo 'camelot_extractor <input_filename> <output_folder> <range>'
else
	#Variables declaration
	FILENAME=$1
	FILENAME_NO_EXTENSION=$(echo $FILENAME | cut -d '.' -f 1)
	DECKNAME=$2
	RANGE=$3

	echo -n $FILENAME
	#echo '*******************************'
	#echo '  Input file: '$FILENAME
	#echo '  Deck name:  '$DECKNAME
	#echo '*******************************'

	#Replace bg color with transparent alpha channel
	#echo '1. Removing background...'
	bash ./mktrans -A $FILENAME

	#Add 1 pixel transparent border and make sure all color under the transparency is white:
	convert $FILENAME_NO_EXTENSION-transparent.png -bordercolor none -border 1 -background white -alpha background -bordercolor white tmp_border.png

	#Threshold to black and white - creating a mask used to cut single cards in the next step
	#echo '2. Creating mask...'
	convert tmp_border.png -alpha off -negate -threshold 0 -type bilevel tmp_mask.png

	#Run connected components labeling to extract the bounds of the white thresholded cards using the mask
	#and crop the white background image to extract the cards
	#echo '3. Extracting cards...'
	OLD_IFS=$IFS
	IFS=$'\n'
	arr=(`convert tmp_mask.png \
	-define connected-components:verbose=true \
	-define connected-components:area-threshold=10 \
	-define connected-components:mean-color=true \
	-connected-components 8 \
	null: | tail -n +2 | sed 's/^[ ]*//'`)
	IFS=$OLD_IFS
	num=${#arr[*]}

	#salvare con nomi diversi gli output in base al range dato come terz$
	INDICE_CORRETTO=0
	case $RANGE in
	"A")
		RANGE_INDEX=1
		;;
	"K")
		RANGE_INDEX=5
		;;
        "Q")
                RANGE_INDEX=9
                ;;
        "J")
                RANGE_INDEX=13
                ;;
        "10")
                RANGE_INDEX=17
                ;;
        "9")
                RANGE_INDEX=21
                ;;
        "8")
                RANGE_INDEX=25
                ;;
        "7")
                RANGE_INDEX=29
                ;;
        "6")
                RANGE_INDEX=33
                ;;
        "5")
                RANGE_INDEX=37
                ;;
        "4")
                RANGE_INDEX=41
                ;;
        "3")
                RANGE_INDEX=45
                ;;
        "2")
                RANGE_INDEX=49
                ;;
	esac

	for ((i=0; i<num; i++))
	do
		bbox=`echo "${arr[$i]}" | cut -d\  -f2`
		color=`echo "${arr[$i]}" | cut -d\  -f5`
		if [ "$color" = "gray(255)" ]; then
			INDICE_CORRETTO=$((i+RANGE_INDEX-1));
			convert tmp_border.png -crop $bbox +repage -background none -deskew 40% output/${DECKNAME}/${INDICE_CORRETTO}.png
			echo -n '.'
		fi
	done
	echo ''

	#Remove tmp files
	rm $FILENAME_NO_EXTENSION-transparent.png
	rm tmp_border.png
	rm tmp_mask.png
fi
