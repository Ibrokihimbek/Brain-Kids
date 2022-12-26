import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class TrueAnswersLength extends StatelessWidget {
  final Map<int, bool> userResult;
  final BuildContext context;
  const TrueAnswersLength(
      {super.key, required this.context, required this.userResult});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: queryHeight(context) * 0.085,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'True answers'.tr(),
            style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF).copyWith(
              fontSize: queryHeight(context) * 0.03,
            ),
          ),
          Text(
            ' - ${userResult.length} / ${trueAnswer()}',
            style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF).copyWith(
              fontSize: queryHeight(context) * 0.03,
            ),
          ),
        ],
      ),
    );
  }

  trueAnswer() {
    int a = 0;
    for (int i = 0; i <= userResult.length; i++) {
      if (userResult[i] == true) {
        a++;
      }
    }
    return a;
  }
}
