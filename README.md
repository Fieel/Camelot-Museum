# Camelot Museum
Project for http://camelotstore.ch/, scan and digitalize over 60'000 historical playing cards and showcase them in a website that will be used as an online museum.

## 1. Website
* Laravel: https://laravel.com/
* Phaser.js: https://phaser.io/


The website will be built using PHP and the Laravel Framework, the main dependency will be the Phaser.js library.

## 2. Camelot-Deck-extractor
Takes a png image, detects the background, cuts it and slices the image saving single files for every object laying on the background.

#### 2.1 Tools
* Imagemagick: https://www.imagemagick.org/script/command-line-options.php
* mktrans: https://github.com/hackerb9/mktrans

#### 2.2 Documentation

1. Takes a scanned png image containing a deck of cards laid over a colored background
2. Detects the background and removes it replacing the background-color with a transparent alpha channel.
3. Cuts every single card and outputs a png file for every card in the deck.
