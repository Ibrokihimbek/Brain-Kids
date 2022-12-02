import 'package:flutter/material.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class CategoryWidget extends StatelessWidget {
  VoidCallback onTap;
  String buttonName;
  CategoryWidget({super.key, required this.onTap, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          queryHeight(context) * 0.03,
        ),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: queryHeight(context) * 0.1,
          decoration: BoxDecoration(
            color: AppColors.C_FDC642,
            borderRadius: BorderRadius.circular(
              queryHeight(context) * 0.03,
            ),
          ),
          child: Center(
            child: Text(
              buttonName,
              style: fontSourceSansProW600(
                appcolor: AppColors.C_FFFFFF,
              ).copyWith(fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
