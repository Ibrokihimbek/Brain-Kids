import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_brain/models/english_alphabet_model.dart';
import 'package:kids_brain/models/tasks_model.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class EnglishQuestionPage extends StatefulWidget {
  const EnglishQuestionPage({super.key});

  @override
  State<EnglishQuestionPage> createState() => _EnglishQuestionPageState();
}

class _EnglishQuestionPageState extends State<EnglishQuestionPage> {
  String alphabet = 'A';
  Color button = AppColors.C_FDC642;
  List english = shuffle(EnglishAlphabet.aplphabetList);
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
                height: MediaQuery.of(context).size.height * 0.148.h,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10).r,
                  child: Column(
                    children: [
                      Text(
                        "English alphabet".tr(),
                        style:
                            fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                                .copyWith(
                          fontSize: MediaQuery.of(context).size.height * 0.03.h,
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
                  return englishAlphabetlist(english[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget englishAlphabetlist(EnglishAlphabet english) {
    return Padding(
      padding: const EdgeInsets.all(6).r,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.height * 0.04.h,
        ),
        onTap: () {
          setState(() {
           
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.199.w,
          height: MediaQuery.of(context).size.height * 0.1.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.height * 0.04.h,
            ),
            color: button,
          ),
          child: Center(
            child: Text(
              english.letter,
              style:
                  fontSourceSansProW600(appcolor: AppColors.C_FFFFFF).copyWith(
                fontSize: MediaQuery.of(context).size.height * 0.05.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// int fromascii = alphabet.codeUnitAt(0) + 1;
//                 alphabet = String.fromCharCode(fromascii);