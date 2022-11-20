import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class ArabicQuestionPage extends StatefulWidget {
  const ArabicQuestionPage({super.key});

  @override
  State<ArabicQuestionPage> createState() => _ArabicQuestionPageState();
}

class _ArabicQuestionPageState extends State<ArabicQuestionPage> {
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
                height: MediaQuery.of(context).size.height * 0.136.h,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10).r,
                  child: Column(
                    children: [
                      Text(
                        "Arabic alphabet".tr(),
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        MediaQuery.of(context).size.height * 0.04.h,
                      ),
                      topRight: Radius.circular(
                        MediaQuery.of(context).size.height * 0.04.h,
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
