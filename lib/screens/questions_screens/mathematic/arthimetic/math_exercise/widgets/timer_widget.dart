import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/screens/app_routes.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

Widget timer({required BuildContext context, required userResult}) {
  final _controller = CountDownController();
  return SizedBox(
    height: queryHeight(context) * 0.15,
    width: queryWidth(context) * 0.32,
    child: CountDownProgressIndicator(
      controller: _controller,
      valueColor: AppColors.C_FDC642,
      backgroundColor: AppColors.C_A5A5A5,
      timeTextStyle:
          fontSourceSansProW600(appcolor: AppColors.C_FFFFFF).copyWith(
        fontSize: queryHeight(context) * 0.03,
      ),
      initialPosition: 1,
      duration: 60,
      text: 'Seconds'.tr(),
      labelTextStyle:
          fontSourceSansProW600(appcolor: AppColors.C_FFFFFF).copyWith(
        fontSize: queryHeight(context) * 0.02,
      ),
      onComplete: () {
        Navigator.pushReplacementNamed(context, RoutName.result,
            arguments: {'result': userResult});
      },
    ),
  );
}
