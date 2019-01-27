# Status: On-hold
I've been working on this project during my last semester of CS at school. We didn't finish the work and now that i finished the semester the project is now on-hold. I'm sitting the code here in case someone will pick it up and continue developing the project.

# Camelot Museum
Project for http://camelotstore.ch/, scanning and digitalizing over 60'000 historical playing cards and showcase them in a website that will be used as an online museu

## 2. Camelot-Deck-extractor
In the root folder folder you can find some bash shell scripts that will automatize the process of scanning new decks.

This is what i've been working on the most: takes a png image, detects the background, cuts it and slices the image saving single files for every object laying on the background.

#### 2.1 Tools
* Imagemagick: https://www.imagemagick.org/script/command-line-options.php
* mktrans: https://github.com/hackerb9/mktrans

#### 2.2 Documentation

1. Takes a scanned png image containing a deck of cards laid over a colored background
2. Detects the background and removes it replacing the background-color with a transparent alpha channel.
3. Cuts every single card and outputs a png file for every card in the deck.
