import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/local_data/storage_repository.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/screens/app_routes.dart';
import 'package:kids_brain/widgets/button_widget.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

import 'package:shared_preferences/shared_preferences.dart';



class LoginPage extends StatelessWidget {
LoginPage({super.key});

  final myController = TextEditingController();

  final _key = GlobalKey<FormState>();

  bool isPass = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.C_7292CF,
            AppColors.C_2855AE,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SafeArea(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.imageLogin),
                        fit: BoxFit.contain,
                      ),
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 75, left: 50),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          queryHeight(context) * 0.04,
                        ),
                        topRight: Radius.circular(
                          queryHeight(context) * 0.04,
                        ),
                      ),
                    ),
                    width: double.infinity,
                    height: queryHeight(context) * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: queryHeight(context) * 0.036,
                          ),
                          Text(
                            'Register'.tr(),
                            style: fontSourceSansPro700(
                                    appcolor: AppColors.C_000000)
                                .copyWith(
                              fontSize: queryHeight(context) * 0.03,
                            ),
                          ),
                          SizedBox(
                            height: queryHeight(context) * 0.028,
                          ),
                          TextFormField(
                            controller: myController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name'.tr();
                              }
                            },
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Enter your Name'.tr(),
                              hintStyle: fontSourceSansProW600(
                                  appcolor: AppColors.C_A5A5A5),
                            ),
                          ),
                          SizedBox(
                            height: queryHeight(context) * 0.18,
                          ),
                          buttonLarge(
                            context: context,
                            onTap: () {
                              if (_key.currentState!.validate()) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                StorageRepository.setString(
                                    'name', myController.text);
                                saveLogin(context);
                              }
                            },
                            buttonName: 'Register'.tr(),
                            buttonNameColor: AppColors.C_FFFFFF,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveLogin(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isLoggedIn", true);

    Navigator.pushNamedAndRemoveUntil(context, RoutName.home, (route) => false);
  }
}
