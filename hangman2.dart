import 'dart:convert';
import 'dart:io';
import 'dart:math';

Random rand = Random();
// List of words to guess from.
final List<String> wordList = ['Javascript', 'Python', 'Dart', 'Flutter', 'Kotlin'];
// Picking a random word to displaay to the player
var word = wordList[rand.nextInt(wordList.length)];

void main(List<String> args) {

}

class Hangman {
  // ignore: prefer_typing_uninitialized_variables
  var guess;

  // To hold a reference of wrong attempts made for each current word.
  var wrongGuess = [];

  // Holds every curent word that is to be guessed.
  List<String> wordToGuess = [];

  // Option to choose which game to play
  var gameOption = 0;

  // getting the wrong attempts from the list of failed attempts and ddisplaying them.
  String get displayWrongeGuess => wrongGuess.join();

  // A variable to keep track of every current guessing word and displays the full wword when done
  String get fullWord => wordToGuess.join();

  game() {
    print("Select 1 for Hangman or 2 for Tic Tac Toe");

    gameOption = stdin.readLineSync(encoding: utf8) as int;

    if (gameOption == 1) {
      print("Guess the programmming Language");

      print("Enter a letter to begin");
      guess = stdin.readLineSync(encoding: utf8);


    }
  }

// check to see if every letter in the word has been guessed
  bool get isWordComplete {
    for (String letter in wordList) {
      if (!guess.contains(letter)) {
        return false;
      }
    }
    return true;
  }

// keep track of the guess letters
  void guessedLetter(String letter) {
    // store the guessed letter
    guess.add(letter);

     // getting the entire list of words
      for (var i = 0; i < wordList.length; i++) {
        // Displaying a random word for the player to guess the word

            // Displaying the hint here for each word to be guessed using the wordToGuess variable.....At every given point this variable is supposed to an item but we don't want to display the word just a hint.....

          if (guess.contains(letter)) {
        // logic to append characters to the guesses list to make up the complete word

        // YOu need to display the current random word here like this J_VCR_P

        // This code here is supposed to do that but i cant get passed here
        String wordForDisplay => wordToGuess.map((String letter) => guess.contains(letter) ? letter : "_").join();


        if (isWordComplete) {
          print('You guessed the complete word $fullWord');
        }
        else {
          print('Keep trying to guess the complete word');
          print('You have guessed $displayWrongeGuess');
        }
      }
    }
  }

// New Game
  newGame() {
    // shuffle the word list into a random order
    wordList.shuffle();

    // break the first word from the shuffled list into a list of letters
    guess = wordList.first.split('');

    // clear the set of worng guess letters
    wrongGuess.clear();
  }
}