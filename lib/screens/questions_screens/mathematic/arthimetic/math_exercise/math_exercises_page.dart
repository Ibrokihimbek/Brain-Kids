import 'dart:async';
import 'dart:math';

import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/screens/app_routes.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/arthimetic/math_exercise/widgets/progress_widget.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/arthimetic/math_exercise/widgets/timer_vidget.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/arthimetic/math_exercise/widgets/unswer_button_widget.dart';
import 'package:kids_brain/service/shuffle.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class MathExercisesPage extends StatefulWidget {
  const MathExercisesPage({super.key});

  @override
  State<MathExercisesPage> createState() => _MathExercisesPageState();
}

class _MathExercisesPageState extends State<MathExercisesPage> {
  final _controller = CountDownController();
  Map<int, bool> userResult = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    6: false,
    7: false,
    8: false,
    9: false,
  };
  final controller = TextEditingController();
  int currentIndex = 0;
  String buttontext = 'Next';
  int randomOne = Random().nextInt(10);
  int randomTwo = Random().nextInt(10);
  int c = 0;

  void generateNumbers() {
    randomOne = Random().nextInt(10);
    randomTwo = Random().nextInt(10);
  }

  String truAnsver = '';

  @override
  Widget build(BuildContext context) {
    List number = [
      randomOne + randomTwo,
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20)
    ];
    c = randomOne + randomTwo;
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
                timer(),
                ProgressWidget(
                  index: currentIndex + 1,
                  questionLength: 10,
                  currentWidth: (MediaQuery.of(context).size.width * 0.6) *
                      ((currentIndex + 1) / 10),
                ),
                SizedBox(height: queryHeight(context) * 0.15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$randomOne',
                      style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                          .copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    SizedBox(width: queryWidth(context) * 0.04),
                    Text(
                      '+',
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
                SizedBox(height: queryHeight(context) * 0.06),
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

  Widget timer() {
    return SizedBox(
      height: 200,
      width: 200,
      child: CountDownProgressIndicator(
        controller: _controller,
        valueColor: Colors.red,
        backgroundColor: Colors.blue,
        initialPosition: 1,
        duration: 2,
        onComplete: () {
          Navigator.pushReplacementNamed(context, RoutName.result,
              arguments: {'result': userResult});
        },
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
