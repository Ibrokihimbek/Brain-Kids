import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_brain/models/tasks_model.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_routes.dart';
import 'package:kids_brain/widgets/button_widget.dart';
import 'package:kids_brain/widgets/change_name_widget.dart';
import 'package:kids_brain/widgets/settings_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../local_data/storage_repository.dart';
import '../widgets/font_style_widget.dart';

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
                height: MediaQuery.of(context).size.height * 0.21.h,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 60).r,
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
                              size: MediaQuery.of(context).size.height * 0.045,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20).r,
                            child: Row(
                              children: [
                                Text(
                                  "Hi".tr(),
                                  style: fontSourceSansProW600(
                                          appcolor: AppColors.C_FFFFFF)
                                      .copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03.h,
                                  ),
                                ),
                                Text(
                                  " $name",
                                  style: fontSourceSansProW600(
                                          appcolor: AppColors.C_FFFFFF)
                                      .copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03.h,
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
                        MediaQuery.of(context).size.height * 0.04.h,
                      ),
                      topRight: Radius.circular(
                        MediaQuery.of(context).size.height * 0.04.h,
                      ),
                    ),
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7080.h,
                  child: Padding(
                    padding: const EdgeInsets.all(12).r,
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04.h,
                        ),
                        buttonLarge(
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
                          height: MediaQuery.of(context).size.height * 0.012.h,
                        ),
                        buttonLarge(
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
            ],
          ),
        ),
      ),
    );
  }

  Widget taskList(TasksModels task, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: InkWell(
        onTap: () {
          if (index == 0) {
            Navigator.pushNamed(context, RoutName.english);
          } else if (index == 1) {
            Navigator.pushNamed(context, RoutName.arabic);
          } else if (index == 2) {
            Navigator.pushNamed(context, RoutName.russian);
          } else if (index == 3) {
            Navigator.pushNamed(context, RoutName.mathematic);
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.163.h,
          height: MediaQuery.of(context).size.height * 0.132.h,
          decoration: BoxDecoration(
            color: AppColors.C_F5F6FC,
            borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.height * 0.04.h,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25.h,
                height: MediaQuery.of(context).size.height * 0.12.h,
                child: Image.asset(
                  task.imageName,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.024.h),
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
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("isLoggedIn", false);

    Navigator.pushNamedAndRemoveUntil(
        context, RoutName.login, (route) => false);
  }
}
