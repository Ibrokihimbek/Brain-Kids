import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/models/rusian/russian_alphabet_model.dart';
import 'package:kids_brain/service/shuffle.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';
import 'package:kids_brain/screens/questions_screens/widgets/gridvew_alphabet_widget.dart';

class RussianQuestionPage extends StatefulWidget {
  List<RussianAlphabetModel> russian;

  RussianQuestionPage({super.key, required this.russian});

  @override
  State<RussianQuestionPage> createState() => _RussianQuestionPageState();
}

class _RussianQuestionPageState extends State<RussianQuestionPage> {
  List russianAlphabet = [];
  @override
  void initState() {
    super.initState();
    russianAlphabet = shuffle(RussianAlphabetModel.aplphabetList);
    for (var element in russianAlphabet) {
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
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      children: [
                        Text(
                          "Russian alphabet".tr(),
                          style: fontSourceSansProW600(
                                  appcolor: AppColors.C_FFFFFF)
                              .copyWith(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ),
                        Image.asset(AppImages.imageStars),
                      ],
                    ),
                  ),
                ),
                GridvewAlphabetsWidget(
                  alphabets: russianAlphabet,
                  letter: 'А',
                  alphabetModel: widget.russian,
                  lastLetter: 'а',
                  constantLetter: 'А',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
