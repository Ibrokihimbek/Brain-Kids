import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/screens/app_routes.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLog = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLog = pref.getBool("isLoggedIn") ?? false;
    return pref.getBool("isLoggedIn") ?? false;
  }

  @override
  void initState() {
    super.initState();

    isLoggedIn();
    goNext();
  }

  void goNext() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacementNamed(
            context, isLog ? RoutName.home : RoutName.login);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.C_7292CF,
              AppColors.C_2855AE,
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 160, bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brain\nKids'.tr(),
                    textAlign: TextAlign.center,
                    style: fontSourceSansProW800(appcolor: AppColors.C_FFFFFF)
                        .copyWith(fontSize: queryHeight(context) * 0.04),
                  ),
                  Image.asset(AppImages.imageSplash),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
