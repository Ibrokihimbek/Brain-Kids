import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/local_data/storage_repository.dart';
import 'package:kids_brain/models/arabic/arabic_alphabet_model.dart';
import 'package:kids_brain/models/english/english_alphabet_model.dart';
import 'package:kids_brain/models/rusian/russian_alphabet_model.dart';
import 'package:kids_brain/models/tasks_model.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_media_query.dart';
import 'package:kids_brain/screens/app_routes.dart';
import 'package:kids_brain/widgets/button_widget.dart';
import 'package:kids_brain/widgets/change_name_widget.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';
import 'package:kids_brain/widgets/settings_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String name = StorageRepository.getStringt('name');
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
        key: scaffoldKey,
        drawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.C_7292CF,
                  AppColors.C_2855AE,
                ],
              ),
            ),
            child: const SettingsWidget(),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(),
                width: double.infinity,
                height: queryHeight(context) * 0.28,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () =>
                                scaffoldKey.currentState!.openDrawer(),
                            icon: Icon(
                              Icons.menu_rounded,
                              color: AppColors.C_FFFFFF,
                              size: queryHeight(context) * 0.045,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Hi".tr(),
                                  style: fontSourceSansProW600(
                                          appcolor: AppColors.C_FFFFFF)
                                      .copyWith(
                                    fontSize: queryHeight(context) * 0.03,
                                  ),
                                ),
                                Text(
                                  " $name",
                                  style: fontSourceSansProW600(
                                          appcolor: AppColors.C_FFFFFF)
                                      .copyWith(
                                    fontSize: queryHeight(context) * 0.03,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Image.asset(AppImages.imageStars),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
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
                  height: queryHeight(context) * 0.7080,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: TasksModels.learn.length,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return taskList(
                                TasksModels.learn[index],
                                index,
                              );
                            },
                          ),
                          buttonLarge(
                              context: context,
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ChangeNameWidget(
                                      newName: (controller) {
                                        StorageRepository.setString(
                                            'name', controller.text);
                                        setState(() {});
                                      },
                                    );
                                  },
                                );
                              },
                              buttonName: 'Change name'.tr(),
                              buttonNameColor: AppColors.C_FFFFFF),
                          SizedBox(
                            height: queryHeight(context) * 0.01,
                          ),
                          buttonLarge(
                              context: context,
                              onTap: () {
                                saveLogin(context);
                              },
                              buttonName: 'logout'.tr(),
                              buttonNameColor: AppColors.C_FFFFFF),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget taskList(TasksModels task, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (index == 0) {
            Navigator.pushNamed(context, RoutName.english, arguments: {
              'englishAlphabet': EnglishAlphabetModel.aplphabetList
            });
          } else if (index == 1) {
            Navigator.pushNamed(context, RoutName.arabic, arguments: {
              'arabicAlphabet': ArabicAlphabetModel.aplphabetList
            });
          } else if (index == 2) {
            Navigator.pushNamed(context, RoutName.russian, arguments: {
              'russianAlphabet': RussianAlphabetModel.aplphabetList
            });
          } else if (index == 3) {
            Navigator.pushNamed(context, RoutName.mathematic);
          }
        },
        child: Container(
          width: queryWidth(context) * 0.163,
          height: queryHeight(context) * 0.132,
          decoration: BoxDecoration(
            color: AppColors.C_F5F6FC,
            borderRadius: BorderRadius.circular(
              queryHeight(context) * 0.04,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: queryWidth(context) * 0.25,
                height: queryHeight(context) * 0.12,
                child: Image.asset(
                  task.imageName,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: queryHeight(context) * 0.024),
              Text(
                task.taskName.tr(),
                style: fontSourceSansProW400(appcolor: AppColors.C_000000),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveLogin(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isLoggedIn", false);

    Navigator.pushNamedAndRemoveUntil(
        context, RoutName.login, (route) => false);
  }
}
