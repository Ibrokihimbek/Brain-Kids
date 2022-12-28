import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/screens/app_routes.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/arthimetic/math_exercise/widgets/progress_widget.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/arthimetic/math_exercise/widgets/timer_widget.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/arthimetic/math_exercise/widgets/unswer_button_widget.dart';
import 'package:kids_brain/service/shuffle.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class MathExercisesPage extends StatefulWidget {
  final String symbol;
  const MathExercisesPage({super.key, required this.symbol});

  @override
  State<MathExercisesPage> createState() => _MathExercisesPageState();
}

class _MathExercisesPageState extends State<MathExercisesPage> {
  Map<int, bool> userResult = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
    8: false,
    9: false,
  };

  int currentIndex = 0;
  String buttontext = 'Next';
  num randomOne = Random().nextInt(10) + 20;
  num randomTwo = Random().nextInt(10) + 1;
  num c = 0;

  void generateNumbers() {
    randomOne = widget.symbol == 'x'
        ? Random().nextInt(10) + 1
        : Random().nextInt(10) + 20;
    randomTwo = Random().nextInt(10) + 1;
  }

  String truAnsver = '';

  @override
  Widget build(BuildContext context) {
    List number = [
      widget.symbol == '+'
          ? randomOne + randomTwo
          : widget.symbol == '-'
              ? randomOne - randomTwo
              : widget.symbol == '/'
                  ? randomOne ~/ randomTwo
                  : randomOne.toString().length == 2
                      ? (randomOne ~/ 10) * randomTwo
                      : randomOne * randomTwo,
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
    ];
    c = widget.symbol == '+'
        ? randomOne + randomTwo
        : widget.symbol == '-'
            ? randomOne - randomTwo
            : widget.symbol == '/'
                ? randomOne ~/ randomTwo
                : randomOne.toString().length == 2
                    ? (randomOne ~/ 10) * randomTwo
                    : randomOne * randomTwo;
    number = shuffle(number);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.C_7292CF,
            AppColors.C_2855AE,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  width: double.infinity,
                  height: queryHeight(context) * 0.148,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      children: [
                        Text(
                          "Do the task".tr(),
                          style: fontSourceSansProW600(
                                  appcolor: AppColors.C_FFFFFF)
                              .copyWith(
                            fontSize: queryHeight(context) * 0.03,
                          ),
                        ),
                        Image.asset(AppImages.imageStars),
                      ],
                    ),
                  ),
                ),
                timer(context: context, userResult: userResult),
                ProgressWidget(
                  index: currentIndex + 1,
                  questionLength: 10,
                  currentWidth: (MediaQuery.of(context).size.width * 0.6) *
                      ((currentIndex + 1) / 10),
                ),
                SizedBox(height: queryHeight(context) * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.symbol == "x" && randomOne.toString().length == 2
                          ? "${randomOne ~/ 10}"
                          : widget.symbol == "/"
                              ? '${(randomTwo * c)}'
                              : "$randomOne",
                      style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                          .copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    SizedBox(width: queryWidth(context) * 0.04),
                    Text(
                      widget.symbol,
                      style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                          .copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    SizedBox(width: queryWidth(context) * 0.04),
                    Text(
                      '$randomTwo',
                      style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                          .copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: queryHeight(context) * 0.07),
                SizedBox(
                  height: queryHeight(context) * 0.22,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: number.length,
                    primary: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.5 / 1.1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return answersItem(
                        number[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget answersItem(number) {
    return AnswerButtonWidget(
      context: context,
      onTap: () {
        truAnsver = number.toString();
        if (c.toString() == truAnsver) {
          userResult[currentIndex] = true;
        } else {
          userResult[currentIndex] = false;
        }

        nextQuestion();
      },
      number: number,
    );
  }

  nextQuestion() {
    setState(() {
      generateNumbers();
      if (currentIndex != 10) {
        truAnsver = '';
        currentIndex++;
      }
      if (currentIndex == 10) {
        Navigator.pushReplacementNamed(context, RoutName.result,
            arguments: {'result': userResult});
      }
    });
  }
}
