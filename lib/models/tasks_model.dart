import 'package:kids_brain/utils/app_images.dart';
import "dart:math";

class TasksModels {
  String imageName;
  String taskName;

  TasksModels({required this.imageName, required this.taskName});

  static List<TasksModels> learn = [
    TasksModels(
        imageName: AppImages.imageAlphabetEnglish,
        taskName: 'English language'),
    TasksModels(
        imageName: AppImages.imageAlphabetArabic, taskName: 'Arabic language'),
    TasksModels(
        imageName: AppImages.imageAlphabetRussian,
        taskName: 'Russian language'),
    TasksModels(imageName: AppImages.imageMathematic, taskName: 'Numbers'),
  ];
  static List english1 = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
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
