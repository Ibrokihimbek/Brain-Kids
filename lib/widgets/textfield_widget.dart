import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

Widget textFieldName({required String hinttext}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) return 'Please enter your name'.tr();
    },
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      hintText: hinttext,
      hintStyle: fontSourceSansProW600(appcolor: AppColors.C_A5A5A5),
    ),
  );
}