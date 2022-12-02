import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/models/english/english_alphabet_model.dart';
import 'package:kids_brain/service/shuffle.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';
import 'package:kids_brain/widgets/gridvew_alphabet_widget.dart';

class EnglishQuestionPage extends StatefulWidget {
  List<EnglishAlphabetModel> english;
  EnglishQuestionPage({super.key, required this.english});

  @override
  State<EnglishQuestionPage> createState() => _EnglishQuestionPageState();
}

class _EnglishQuestionPageState extends State<EnglishQuestionPage> {
  List englishAlphabet = [];
  @override
  void initState() {
    super.initState();
    englishAlphabet = shuffle(EnglishAlphabetModel.aplphabetList);
    for (var element in englishAlphabet) {
      element.onSelected = null;
    }
  }

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
                height: queryHeight(context) * 0.18,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    children: [
                      Text(
                        "English alphabet".tr(),
                        style:
                            fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                                .copyWith(
                          fontSize: queryHeight(context) *0.03,
                        ),
                      ),
                      Image.asset(AppImages.imageStars),
                    ],
                  ),
                ),
              ),
              GridvewAlphabetsWidget(
                alphabets: englishAlphabet,
                letter: "A",
                alphabetModel: widget.english,
                lastLetter: '[',
                constantLetter: 'A',
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
