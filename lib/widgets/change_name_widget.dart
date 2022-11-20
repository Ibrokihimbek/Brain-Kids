import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/widgets/button_widget.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class ChangeNameWidget extends StatefulWidget {
  ValueChanged<TextEditingController> newName;
  ChangeNameWidget({super.key, required this.newName});

  @override
  State<ChangeNameWidget> createState() => _ChangeNameWidgetState();
}

class _ChangeNameWidgetState extends State<ChangeNameWidget> {
  final formKey = GlobalKey<FormState>();
  final cantrollerEditName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Expanded(
        child: Container(
          padding: const EdgeInsets.all(24).r,
          height: 340.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              color: AppColors.C_F5F6FC),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text('Change account name'.tr(),
                    style: fontSourceSansProW400(appcolor: AppColors.C_000000)),
                SizedBox(height: 10.h),
                const Divider(thickness: 1, color: AppColors.C_000000),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: cantrollerEditName,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(color: AppColors.C_000000),
                  decoration: InputDecoration(
                    counterStyle: const TextStyle(color: AppColors.C_000000),
                    hintText: 'New name'.tr(),
                    hintStyle:
                        fontSourceSansProW400(appcolor: AppColors.C_000000),
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.C_000000, width: 0.8),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.C_000000, width: 0.8),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02.h,),
                buttonLarge(
                  onTap: () {
                    widget.newName(cantrollerEditName);
                    Navigator.pop(context);
                  },
                  buttonName: 'Edit'.tr(),
                  buttonNameColor: AppColors.C_FFFFFF,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01.h,),
                buttonLarge(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonName: 'Cancel'.tr(),
                  buttonNameColor: AppColors.C_FFFFFF,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
