import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/screens/app_routes.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/widgets/category_widget.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class MathematicQuestionPage extends StatelessWidget {
  const MathematicQuestionPage({super.key});

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
                        "Mathematics".tr(),
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
              SizedBox(height: queryHeight(context) * 0.2),
              CategoryWidget(
                onTap: () {
                  Navigator.pushNamed(context, RoutName.arthimetik);
                },
                buttonName: 'Arithmetic operations'.tr(),
              ),
              SizedBox(height: queryHeight(context) * 0.015),
              CategoryWidget(
                onTap: () {
                  Navigator.pushNamed(context, RoutName.numbers);
                },
                buttonName: 'Numbers'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
