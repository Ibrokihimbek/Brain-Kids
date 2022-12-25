import 'package:flutter/material.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class ProgressWidget extends StatelessWidget {
  double currentWidth;
  int questionLength;
  int index;

  ProgressWidget({
    Key? key,
    required this.currentWidth,
    required this.questionLength,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: queryHeight(context) * 0.05),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: queryHeight(context) * 0.03,
                  width: (queryWidth(context) * 0.8),
                  decoration: BoxDecoration(
                    color: AppColors.C_A5A5A5.withOpacity(0.017),
                    border: Border.all(
                        width: queryWidth(context) * 0.006,
                        color: AppColors.C_A5A5A5),
                    borderRadius:
                        BorderRadius.circular(queryHeight(context) * 0.024),
                  ),
                ),
              ),
              Positioned(
                top: queryHeight(context) * 0.0095,
                left: queryWidth(context) * 0.03,
                child: Container(
                  height: queryHeight(context) * 0.012,
                  width: (MediaQuery.of(context).size.width * 0.6),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(queryHeight(context) * 0.024),
                    color: AppColors.C_FFFFFF,
                  ),
                ),
              ),
              Positioned(
                top: queryHeight(context) * 0.0095,
                left: queryWidth(context) * 0.03,
                child: AnimatedContainer(
                  height: queryHeight(context) * 0.0125,
                  curve: Curves.easeInOutSine,
                  width: currentWidth,
                  decoration: BoxDecoration(
                    color: AppColors.C_FDC642,
                    borderRadius:
                        BorderRadius.circular(queryHeight(context) * 0.024),
                  ),
                  duration: const Duration(milliseconds: 500),
                ),
              ),
              Positioned(
                top: queryHeight(context) * 0.001,
                left: queryWidth(context) * 0.66,
                child: Text(
                  '$index/${(questionLength)}',
                  style: fontSourceSansProW600(appcolor: AppColors.C_FFFFFF)
                      .copyWith(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
