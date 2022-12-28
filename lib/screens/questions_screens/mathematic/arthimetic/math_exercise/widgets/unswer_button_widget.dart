import 'package:flutter/material.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class AnswerButtonWidget extends StatelessWidget {
  final BuildContext context;
  final VoidCallback onTap;
  final num number;
  const AnswerButtonWidget({
    super.key,
    required this.context,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        queryHeight(context) * 0.04,
      ),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.C_FDC642,
          borderRadius: BorderRadius.circular(
            queryHeight(context) * 0.04,
          ),
        ),
        margin: const EdgeInsets.all(12),
        child: Center(
          child: Text(
            '$number',
            style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF).copyWith(
              fontSize: queryHeight(context) * 0.03,
            ),
          ),
        ),
      ),
    );
  }
}
