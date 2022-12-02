import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/models/numbers/numbers_list.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/numbers/category_numbers/widgets/number_gridview_widget.dart';
import 'package:kids_brain/service/shuffle.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';
import 'package:kids_brain/widgets/gridvew_alphabet_widget.dart';

class NumbersCategoryPage extends StatefulWidget {
  List<Numbers> numbers;
  NumbersCategoryPage({super.key, required this.numbers});

  @override
  State<NumbersCategoryPage> createState() => _NumbersCategoryPageState();
}

class _NumbersCategoryPageState extends State<NumbersCategoryPage> {
  List numbersCategory = [];
  @override
  void initState() {
    super.initState();
    numbersCategory = shuffle(widget.numbers);
    for (var element in numbersCategory) {
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
                  height: queryHeight(context) * 0.148,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      children: [
                        Text(
                          "Numbers".tr(),
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
                NumbersGridViewWidget(
                  constantNumbers: 1,
                  lastNumbers: 11,
                  mathematics: numbersCategory,
                  numbers: 1,
                  numbersModel: widget.numbers,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
