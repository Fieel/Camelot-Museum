#!/bin/bash
#
# @uthor: Filipe Madureira
#
# Uses camelot_extractor.sh <-- extracts cards from scan files
#
# Checks and triggers the camelot_extractor.sh script if any default
# template files exist in the directory, checks for every single case
# preemptively and triggers just cases in whcih a file has actually
# been found in the current directory
#

if [ $# -ne 2 ]
then
	#In case no enough arguments are given
        echo ''
        echo 'Not enough arguments!'
        echo 'Usage:'
        echo 'camelot_start.sh <input_filename> <deck_name>'
        echo ''
	echo '!!! IMPORTANT !!!'
	echo ''
	echo '1. Leave in this folder all the useful files. The program will look for'
	echo 'specific names, for example, if your input filename is "deck"'
	echo 'the script will look for predefined deck_A.png, deck_Q.png,.. and so on'
	echo 'and process all the files it can find.'
	echo ''
	echo '2. A folder with the given deck_name will be created with all the extracted'
	echo 'cards inside of it, numbered following this script logic (see documentation)'
	echo 'Examples:'
	echo '1.png - Ace of hearts'
	echo '2.png - Ace of diamonds'
	echo '...'
	echo ''
else

        #Variables declaration
        FILENAME=input/$1
        DECKNAME=$2
	
	#creazione cartella che conterra i file
	mkdir output/${DECKNAME}

	if [ -f ${FILENAME}_A.png ]
	then
		bash camelot_extractor.sh ${FILENAME}_A.png ${DECKNAME} A
	fi

        if [ -f ${FILENAME}_K.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_K.png ${DECKNAME} K
        fi


        if [ -f ${FILENAME}_Q.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_Q.png ${DECKNAME} Q
        fi


        if [ -f ${FILENAME}_J.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_J.png ${DECKNAME} J
        fi

        if [ -f ${FILENAME}_10.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_10.png ${DECKNAME} 10
        fi

        if [ -f ${FILENAME}_9.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_9.png ${DECKNAME} 9
        fi

        if [ -f ${FILENAME}_8.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_8.png ${DECKNAME} 8
        fi

        if [ -f ${FILENAME}_7.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_7.png ${DECKNAME} 7
        fi

        if [ -f ${FILENAME}_6.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_6.png ${DECKNAME} 6
        fi

        if [ -f ${FILENAME}_5.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_5.png ${DECKNAME} 5
        fi

        if [ -f ${FILENAME}_4.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_4.png ${DECKNAME} 4
        fi

        if [ -f ${FILENAME}_3.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_3.png ${DECKNAME} 3
        fi

        if [ -f ${FILENAME}_2.png ]
        then
                bash camelot_extractor.sh ${FILENAME}_2.png ${DECKNAME} 2
        fi
fi
