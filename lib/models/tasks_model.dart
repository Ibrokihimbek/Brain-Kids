import 'package:kids_brain/utils/app_images.dart';

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
}
