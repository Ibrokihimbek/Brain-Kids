import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/models/arthimetic/arthimetic_models.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/widgets/category_widget.dart';
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
  final controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int currentIndex = 0;
  String buttontext = 'Next';
  @override
  Widget build(BuildContext context) {
    String word = '';
    int a = ArthimeticModels.numbers[currentIndex].a;
    a = Random().nextInt(10);
    int b = ArthimeticModels.numbers[currentIndex].b;
    b = Random().nextInt(10);
    int c = a + b;
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
        body: Form(
          key: _formKey,
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
                          "Do the exercise".tr(),
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
                Row(
                  children: [
                    Text(
                      '$a',
                      style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                          .copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '+',
                      style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                          .copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '$b',
                      style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                          .copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '=',
                      style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                          .copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      width: 200,
                      height: 60,
                      child: TextFormField(
                        style:
                            fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                                .copyWith(
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                        ),
                        controller: controller,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter your password';
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Javobni kiriting',
                          hintStyle: fontSourceSansProW400(
                                  appcolor: AppColors.C_A5A5A5)
                              .copyWith(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: queryHeight(context) * 0.5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: InkWell(
                    onTap: () {
                      nextQuestion();
                    },
                    borderRadius:
                        BorderRadius.circular(queryHeight(context) * 0.04),
                    child: Container(
                      width: double.infinity,
                      height: queryHeight(context) * 0.07,
                      decoration: BoxDecoration(
                        color: AppColors.C_FDC642,
                        borderRadius:
                            BorderRadius.circular(queryHeight(context) * 0.04),
                      ),
                      child: Center(
                        child: Text(
                          buttontext,
                          style: fontSourceSansProW600(
                                  appcolor: AppColors.C_FFFFFF)
                              .copyWith(
                            fontSize: queryHeight(context) * 0.03,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(word),
              ],
            ),
          ),
        ),
      ),
    );
  }

  nextQuestion() {
    setState(() {
      if (buttontext == 'FINISH') {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ResultPage(
        //       pageName: 'Question_Page',
        //       userResult: userResult,
        //     ),
        //   ),
        // );
      }
      if (currentIndex != ArthimeticModels.numbers.length - 1) {
        // start = 15;
        currentIndex++;
      }
      if (currentIndex == ArthimeticModels.numbers.length - 1) {
        print("SALOM $currentIndex");
        buttontext = 'FINISH';
        print("HAYR ${ArthimeticModels.numbers.length - 1}");
      }
    });
  }
}
