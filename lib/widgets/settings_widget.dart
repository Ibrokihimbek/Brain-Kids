import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

int selectedLang = 1;

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    switch (context.locale.languageCode) {
      case 'uz':
        selectedLang = 1;
        break;
      case 'en':
        selectedLang = 2;
        break;
      default:
    }
    return Container(
      padding: const EdgeInsets.all(24),
      height: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text('Change the language'.tr(),
              style: fontSourceSansProW400(appcolor: AppColors.C_FFFFFF)),
          SizedBox(height: 12),
          RadioListTile(
            title: Text("O'zbekcha",
                style: fontSourceSansProW400(appcolor: AppColors.C_FFFFFF)),
            value: 1,
            groupValue: selectedLang,
            onChanged: ((value) {
              setState(
                () {
                  selectedLang = value as int;
                  context.setLocale(
                    const Locale('uz', 'UZ'),
                  );
                },
              );
            }),
          ),
          RadioListTile(
            title: Text("English",
                style: fontSourceSansProW400(appcolor: AppColors.C_FFFFFF)),
            value: 2,
            groupValue: selectedLang,
            onChanged: ((value) {
              setState(
                () {
                  selectedLang = value as int;
                  context.setLocale(
                    const Locale('en', 'US'),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
