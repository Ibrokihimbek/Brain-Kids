import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/models/numbers/numbers_list.dart';
import 'package:kids_brain/screens/app_routes.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/widgets/category_widget.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
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
                        style:
                            fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                                .copyWith(
                          fontSize: queryHeight(context) * 0.03,
                        ),
                      ),
                      Image.asset(AppImages.imageStars),
                    ],
                  ),
                ),
              ),
              SizedBox(height: queryHeight(context) * 0.16),
              Text(
                'Choose your numbers level'.tr(),
                style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                    .copyWith(fontSize: 20),
              ),
              SizedBox(height: queryHeight(context) * 0.015),
              CategoryWidget(
                onTap: () {
                  Navigator.pushNamed(context, RoutName.numbersCategory,
                      arguments: {'numbers': Numbers.numbersOneToTen});
                },
                buttonName: '1 - 10'.tr(),
              ),
              SizedBox(height: queryHeight(context) * 0.015),
              CategoryWidget(
                onTap: () {
                  Navigator.pushNamed(context, RoutName.numbersCategory,
                      arguments: {'numbers': Numbers.numbersOneToFifty});
                },
                buttonName: '1 - 50'.tr(),
              ),
              SizedBox(height: queryHeight(context) * 0.015),
              CategoryWidget(
                onTap: () {
                  Navigator.pushNamed(context, RoutName.numbersCategory,
                      arguments: {'numbers': Numbers.numbersOneToHundred});
                },
                buttonName: '1 - 100'.tr(),
              ),
              SizedBox(height: queryHeight(context) * 0.015),
              CategoryWidget(
                onTap: () {
                  Navigator.pushNamed(context, RoutName.numbersCategory,
                      arguments: {'numbers': Numbers.numbersOneToTwoHundred});
                },
                buttonName: '1 - 200'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
