import 'dart:io';
import 'dart:convert';
import 'hangman.dart';
import 'tictactoe.dart';

void main () {
List accessCode = [243, 256, 124, 126];
print('Welcome, Please input access Code');
int? input = int.parse(stdin.readLineSync()!);
if(accessCode.contains(input)) {
  playerDetails();
print('Enter 1 for hangman or 2 for tictactoe');
int gameOption = int.parse(stdin.readLineSync()!);
if(gameOption == 1 && gameOption != "") {
  String word = randomWord();
  hangman(word);
}else if (gameOption == 2 && gameOption != "") {
generateBoard();
  startGame();
}else{
  print('You entered the wrong number and character is not allowed');
  exit(0);
}
}else{
print('Enter the right access code to play the game');
}

}

void playerDetails() {

print('Please, input your full name');
String name = stdin.readLineSync(encoding: utf8)!;

print('What is your age?');
 int age = int.parse(stdin.readLineSync(encoding: utf8)!);

print('What is your occupation?');
 String occupation = stdin.readLineSync(encoding: utf8)!;
print('Welcome $name you are $age and your Occupation is $occupation');
}



