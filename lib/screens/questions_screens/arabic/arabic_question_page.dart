import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/models/arabic/arabic_alphabet_model.dart';
import 'package:kids_brain/service/shuffle.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';
import 'package:kids_brain/screens/questions_screens/widgets/gridvew_alphabet_widget.dart';

class ArabicQuestionPage extends StatefulWidget {
  List<ArabicAlphabetModel> arabic;

  ArabicQuestionPage({super.key, required this.arabic});

  @override
  State<ArabicQuestionPage> createState() => _ArabicQuestionPageState();
}

class _ArabicQuestionPageState extends State<ArabicQuestionPage> {
  List arabicAlphabet = [];
  @override
  void initState() {
    super.initState();
    arabicAlphabet = shuffle(ArabicAlphabetModel.aplphabetList);
    for (var element in arabicAlphabet) {
      element.onSelected = null;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          "Arabic alphabet".tr(),
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
                GridvewAlphabetsWidget(
                  alphabets: arabicAlphabet,
                  letter: "ا",
                  alphabetModel: widget.arabic,
                  lastLetter: lastLetter(),
                  constantLetter: "ا",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

lastLetter() {
  String lastLetter = 'ي';
  int ascii = lastLetter.codeUnitAt(0) + 1;
  return lastLetter = String.fromCharCode(ascii);
}
