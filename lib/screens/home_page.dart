import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_brain/models/tasks_model.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_images.dart';
import 'package:kids_brain/utils/app_routes.dart';
import 'package:kids_brain/widgets/button_widget.dart';
import 'package:kids_brain/widgets/change_name_widget.dart';
import 'package:kids_brain/widgets/media_query_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../local_data/storage_repository.dart';
import '../widgets/font_style_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(),
                width: double.infinity,
                height: AppHeight(context: context, size: 0.21),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 60).r,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hi",
                            style: fontSourceSansProW600(
                                    appcolor: AppColors.C_FFFFFF)
                                .copyWith(
                              fontSize: AppHeight(context: context, size: 0.03),
                            ),
                          ),
                          Text(
                            " $name",
                            style: fontSourceSansProW600(
                                    appcolor: AppColors.C_FFFFFF)
                                .copyWith(
                              fontSize: AppHeight(context: context, size: 0.03),
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
                        AppHeight(context: context, size: 0.04),
                      ),
                      topRight: Radius.circular(
                        AppHeight(context: context, size: 0.04),
                      ),
                    ),
                  ),
                  width: double.infinity,
                  height: AppHeight(context: context, size: 0.7080),
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
                          height: AppHeight(context: context, size: 0.06),
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
                          height: AppHeight(context: context, size: 0.012),
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
          width: AppWidth(context: context, size: 0.163),
          height: AppHeight(context: context, size: 0.132),
          decoration: BoxDecoration(
            color: AppColors.C_F5F6FC,
            borderRadius: BorderRadius.circular(
              AppHeight(context: context, size: 0.04),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: AppWidth(context: context, size: 0.25),
                height: AppHeight(context: context, size: 0.12),
                child: Image.asset(
                  task.imageName,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: AppHeight(context: context, size: 0.024)),
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
