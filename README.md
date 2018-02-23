# Camelot-Deck-extractor
Takes a png image, detects the background, cuts it and slices the image saving single files for every object laying on the background.

Project for http://camelotstore.ch/

Tools: Imagemagick, mktrans


1. Takes a scanned png image containing a deck of cards laid over a colored background
2. Detects the background and removes it replacing the background-color with a transparent alpha channel.
3. Cuts every single card and outputs a png file for every card in the deck.


## Documentatio

Imagemagick: https://www.imagemagick.org/script/command-line-options.php

mktrans: https://github.com/hackerb9/mktrans
