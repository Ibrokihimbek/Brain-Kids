import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_media_query.dart';
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
          padding: const EdgeInsets.all(24),
          height: queryHeight(context) * 0.545,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(queryHeight(context) * 0.026),
                topRight: Radius.circular(queryHeight(context) * 0.026),
              ),
              color: AppColors.C_F5F6FC),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Change account name'.tr(),
                  style: fontSourceSansProW400(appcolor: AppColors.C_A5A5A5),
                ),
                SizedBox(height: queryHeight(context) * 0.01),
                const Divider(thickness: 1, color: AppColors.C_000000),
                SizedBox(height: queryHeight(context) * 0.016),
                TextFormField(
                  controller: cantrollerEditName,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(color: AppColors.C_000000),
                  decoration: InputDecoration(
                    counterStyle: const TextStyle(color: AppColors.C_000000),
                    hintText: 'New name'.tr(),
                    hintStyle:
                        fontSourceSansProW400(appcolor: AppColors.C_A5A5A5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: queryHeight(context) * 0.02,
                ),
                buttonLarge(
                  context: context,
                  onTap: () {
                    widget.newName(cantrollerEditName);
                    Navigator.pop(context);
                  },
                  buttonName: 'Edit'.tr(),
                  buttonNameColor: AppColors.C_FFFFFF,
                ),
                SizedBox(
                  height: queryHeight(context) * 0.01,
                ),
                buttonLarge(
                  context: context,
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
