import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_brain/models/tasks_model.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';
import 'package:kids_brain/widgets/media_query_widget.dart';

class EnglishQuestionPage extends StatefulWidget {
  const EnglishQuestionPage({super.key});

  @override
  State<EnglishQuestionPage> createState() => _EnglishQuestionPageState();
}

String alphabet = 'A';
Color button = AppColors.C_FDC642;
List english = shuffle(TasksModels.english1);

class _EnglishQuestionPageState extends State<EnglishQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_7292CF,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(),
                width: double.infinity,
                height: AppHeight(context: context, size: 0.136),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10).r,
                  child: Column(
                    children: [
                      Text(
                        "English alphabet".tr(),
                        style:
                            fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                                .copyWith(
                          fontSize: AppHeight(context: context, size: 0.03),
                        ),
                      ),
                      Image.asset(AppImages.imageStars),
                    ],
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: english.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return englishAlphabetlist(
                    english[index], index
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget englishAlphabetlist(String english, index) {
    return Padding(
      padding: const EdgeInsets.all(6).r,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          AppHeight(context: context, size: 0.04),
        ),
        onTap: () {
          setState(
            () {
              if (english == alphabet) {
                button = AppColors.C_0BAC00;
                int fromascii = alphabet.codeUnitAt(0) + 1;
                alphabet = String.fromCharCode(fromascii);
              } else {
                button = AppColors.C_E92020;
              }
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppHeight(context: context, size: 0.04),
            ),
            color: button,
          ),
          child: Center(
            child: Text(
              english,
              style:
                  fontSourceSansProW600(appcolor: AppColors.C_FFFFFF).copyWith(
                fontSize: AppHeight(context: context, size: 0.05),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
