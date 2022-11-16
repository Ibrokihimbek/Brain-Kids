import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';
import 'package:kids_brain/widgets/media_query_widget.dart';

class MathematicQuestionPage extends StatefulWidget {
  const MathematicQuestionPage({super.key});

  @override
  State<MathematicQuestionPage> createState() => _MathematicQuestionPageState();
}

class _MathematicQuestionPageState extends State<MathematicQuestionPage> {
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
                height: AppHeight(context: context, size: 0.136),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10).r,
                  child: Column(
                    children: [
                      Text(
                        "Thighs".tr(),
                        style: fontSourceSansProW600(
                                appcolor: AppColors.C_FFFFFF)
                            .copyWith(
                          fontSize: AppHeight(context: context, size: 0.03),
                        ),
                      ),
                      Image.asset(AppImages.imageStars),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // height: AppHeight(context: context, size: 0.8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        AppHeight(context: context, size: 0.04),
                      ),
                      topRight: Radius.circular(
                        AppHeight(context: context, size: 0.04),
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
