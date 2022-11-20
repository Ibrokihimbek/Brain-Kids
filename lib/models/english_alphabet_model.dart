import 'dart:math';

class EnglishAlphabet {
  String letter;
  bool onSelected;

  EnglishAlphabet({required this.letter, required this.onSelected});

  static List<EnglishAlphabet> aplphabetList = [
    EnglishAlphabet(letter: "Q", onSelected: false),
    EnglishAlphabet(letter: "W", onSelected: false),
    EnglishAlphabet(letter: "E", onSelected: false),
    EnglishAlphabet(letter: "R", onSelected: false),
    EnglishAlphabet(letter: "T", onSelected: false),
    EnglishAlphabet(letter: "Y", onSelected: false),
    EnglishAlphabet(letter: "U", onSelected: false),
    EnglishAlphabet(letter: "I", onSelected: false),
    EnglishAlphabet(letter: "O", onSelected: false),
    EnglishAlphabet(letter: "P", onSelected: false),
    EnglishAlphabet(letter: "A", onSelected: false),
    EnglishAlphabet(letter: "S", onSelected: false),
    EnglishAlphabet(letter: "D", onSelected: false),
    EnglishAlphabet(letter: "F", onSelected: false),
    EnglishAlphabet(letter: "G", onSelected: false),
    EnglishAlphabet(letter: "H", onSelected: false),
    EnglishAlphabet(letter: "J", onSelected: false),
    EnglishAlphabet(letter: "K", onSelected: false),
    EnglishAlphabet(letter: "L", onSelected: false),
    EnglishAlphabet(letter: "Z", onSelected: false),
    EnglishAlphabet(letter: "X", onSelected: false),
    EnglishAlphabet(letter: "C", onSelected: false),
    EnglishAlphabet(letter: "V", onSelected: false),
    EnglishAlphabet(letter: "B", onSelected: false),
    EnglishAlphabet(letter: "N", onSelected: false),
    EnglishAlphabet(letter: "M", onSelected: false),
  ];
}

List shuffle(List array) {
  var random = Random();

  for (var i = array.length - 1; i > 0; i--) {
    var n = random.nextInt(i + 1);
    var temp = array[i];
    array[i] = array[n];
    array[n] = temp;
  }
  return array;
}
