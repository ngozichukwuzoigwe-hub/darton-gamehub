import 'dart:io';
import 'dart:math';
import 'main.dart';
import 'tictactoe.dart';
void mainHangman() {
  /// Pick a random word
  String word = randomWord();
  gameIntro();
  hangman(word);
}

void hangman(String word) {
  /*
  This function will:
  1. Take the word and create a clue (clues are dashes (___) that shows the expected word count but blank)
  2. Ask the user to guess a letter and check if the letter is in the word
  3.If yes, replace the clue with the letter at the correct index
  */

  List clue = ("___ " * word.length).split(" ");

  // Initial state
  print(clue.join(" "));
  int count = 0;

  // Game
  while (true) {
    // User input
    count += 1;
    stdout.write("\nPlease guess a letter: ");
    String choice = stdin.readLineSync()!.toUpperCase();

    /* 
    Allow user to type the whole word or exit the game
    Any other incorrect case, demand a single letter */
    if (choice == word) {
      print("\nAwesome, you guessed the word! Attempts: $count");
      menu();
      break;
    } else if (choice == "EXIT") {
      print("\nBye! See you next time\n");
      break;
    } else if (choice.length > 1) {
      print("\nNope, you can only guess one letter at a time!");
      continue;
    }

    // Check the word for guessed letter
    for (var i = 0; i < word.length; i++) {
      if (clue[i] == choice) {
        continue;
      } else if (word[i] == choice) {
        clue[i] = choice;
      }
    }

    // Current state
    print(clue.join(" "));

    // End the game if there are no more guesses
    if (clue.join("") == word) {
      print("\nAwesome, you guessed the word! Attempts: $count\n");
      menu();
      break;
    }
  }
}
String randomWord() {
  /*
  Reads the givenlist
  Then picks a random word from it
  */
  final random = Random();
  List<String> wordList = ["LOVER", "FLUTTER", "MISERLY","SPIRITUAL", "ROMANCE"];
  String word = wordList[random.nextInt(wordList.length)];
  return word;
}
void gameIntro() {
  print("""\n
  Welcome to DARTON Game Hub! 
   
  To quit the game type "exit"
  """);
}