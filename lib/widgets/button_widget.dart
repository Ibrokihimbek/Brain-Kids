import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

Widget buttonLarge({
  required VoidCallback onTap,
  required String buttonName,
  required Color buttonNameColor,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 314.w,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
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
              .copyWith(fontSize: 16.sp),
        ),
      ),
    ),
  );
}
