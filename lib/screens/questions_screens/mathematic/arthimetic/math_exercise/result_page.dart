import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/screens/app_routes.dart';
import 'package:kids_brain/screens/questions_screens/mathematic/arthimetic/math_exercise/widgets/true_answer_widget.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class ResultPage extends StatelessWidget {
  Map<int, bool> userResult;
  ResultPage({super.key, required this.userResult});

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: queryHeight(context) * 0.04),
                  Center(
                    child: Text(
                      "Your result is".tr(),
                      style: fontSourceSansProW400(appcolor: AppColors.C_FFFFFF)
                          .copyWith(
                        fontSize: queryHeight(context) * 0.03,
                      ),
                    ),
                  ),
                  SizedBox(height: queryHeight(context) * 0.064),
                  ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return resultItem(context, index);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: queryHeight(context) * 0.02);
                    },
                  ),
                  SizedBox(height: queryHeight(context) * 0.05),
                  TrueAnswersLength(
                    context: context,
                    userResult: userResult,
                  ),
                  SizedBox(height: queryHeight(context) * 0.01),
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      queryHeight(context) * 0.03,
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RoutName.arthimetik);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          queryHeight(context) * 0.03,
                        ),
                        color: AppColors.C_FDC642,
                      ),
                      height: queryHeight(context) * 0.085,
                      child: Center(
                        child: Text(
                          'Start Again'.tr(),
                          style: fontSourceSansProW600(
                                  appcolor: AppColors.C_FFFFFF)
                              .copyWith(
                            fontSize: queryHeight(context) * 0.03,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget resultItem(BuildContext context, int index) {
    return Container(
      height: queryHeight(context) * 0.07,
      decoration: BoxDecoration(
        color: AppColors.C_FFFFFF,
        boxShadow: [
          BoxShadow(
            color: userResult[index]! ? AppColors.C_0BAC00 : AppColors.C_E92020,
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(
          queryHeight(context) * 0.03,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              "${index + 1} - ",
              style: fontSourceSansProW400(appcolor: AppColors.C_000000),
            ),
            Text(
              "Task".tr(),
              style: fontSourceSansProW400(appcolor: AppColors.C_000000),
            ),
            const Spacer(),
            userResult[index]!
                ? const Icon(
                    Icons.check_circle_outlined,
                    color: AppColors.C_0BAC00,
                  )
                : const Icon(
                    Icons.remove_circle_outline_sharp,
                    color: AppColors.C_E92020,
                  ),
          ],
        ),
      ),
    );
  }
}
