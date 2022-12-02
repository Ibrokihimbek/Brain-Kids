import 'package:flutter/material.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

Widget buttonLarge({
  required VoidCallback onTap,
  required String buttonName,
  required Color buttonNameColor,
  required context
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: queryHeight(context) * 0.38,
      height: queryWidth(context) * 0.19,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(queryHeight(context) * 0.01),
        gradient: const LinearGradient(
          colors: [
            AppColors.C_2855AE,
            AppColors.C_7292CF,
          ],
        ),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: fontSourceSansProW600(appcolor: buttonNameColor)
              .copyWith(fontSize: queryHeight(context) * 0.024),
        ),
      ),
    ),
  );
}
