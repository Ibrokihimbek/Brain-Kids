import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/screens/app_routes.dart';
import 'package:kids_brain/service/shuffle.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_loties.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class NumbersGridViewWidget extends StatefulWidget {
  List mathematics;
  int numbers;
  int constantNumbers;
  var numbersModel;
  int lastNumbers;
  NumbersGridViewWidget({
    super.key,
    required this.mathematics,
    required this.numbers,
    required this.numbersModel,
    required this.lastNumbers,
    required this.constantNumbers,
  });

  @override
  State<NumbersGridViewWidget> createState() => _NumbersGridViewWidgetState();
}

class _NumbersGridViewWidgetState extends State<NumbersGridViewWidget> {
  @override
  Widget build(BuildContext context) {
    int firstNumbers = widget.constantNumbers;
    return GridView.builder(
      shrinkWrap: true,
      itemCount: widget.mathematics.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return numbersList(widget.mathematics[index], firstNumbers);
      },
    );
  }

  Widget numbersList(number, int frisNumbers) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.height * 0.04,
        ),
        onTap: () async {
          if (number.numbers == widget.numbers) {
            number.onSelected = true;
            int num = widget.numbers + 1;

            widget.numbers = num;
            if (widget.numbers == widget.lastNumbers) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (ctx) => CupertinoAlertDialog(
                  title: Text(
                    "Congratulations".tr(),
                    style: fontSourceSansProW600(appcolor: AppColors.C_2855AE),
                  ),
                  content: Column(
                    children: [
                      Lottie.asset(AppLoties.lotieWin),
                      Text(
                        'You have won'.tr(),
                        style:
                            fontSourceSansProW600(appcolor: AppColors.C_2855AE),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutName.home, (route) => false);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: Text(
                          "Return to the main window".tr(),
                          style: fontSourceSansProW400(
                              appcolor: AppColors.C_000000),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        widget.numbers = frisNumbers;
                        setState(
                          () {
                            Navigator.pop(context);
                          },
                        );
                        widget.mathematics = shuffle(widget.numbersModel);
                        for (var element in widget.mathematics) {
                          element.onSelected = null;
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: Text(
                          "Try again".tr(),
                          style: fontSourceSansProW400(
                              appcolor: AppColors.C_000000),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            number.onSelected = false;
            setState(() {});

            widget.numbers = frisNumbers;
            await Future.delayed(const Duration(milliseconds: 800));

            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) => CupertinoAlertDialog(
                title: Text(
                  "Game over".tr(),
                  style: fontSourceSansProW600(appcolor: AppColors.C_2855AE),
                ),
                content: Lottie.asset(AppLoties.lotieCryBear),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutName.home, (route) => false);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        "Return to the main window".tr(),
                        style:
                            fontSourceSansProW400(appcolor: AppColors.C_000000),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(
                        () {
                          Navigator.pop(context);
                        },
                      );
                      widget.mathematics = shuffle(widget.numbersModel);
                      for (var element in widget.mathematics) {
                        element.onSelected = null;
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        "Try again".tr(),
                        style:
                            fontSourceSansProW400(appcolor: AppColors.C_000000),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          setState(() {});
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.199,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.height * 0.04,
            ),
            color: number.onSelected == null
                ? AppColors.C_FDC642
                : number.onSelected!
                    ? AppColors.C_0BAC00
                    : AppColors.C_E92020,
          ),
          child: Center(
            child: Text(
              '${number.numbers}',
              style:
                  fontSourceSansProW600(appcolor: AppColors.C_FFFFFF).copyWith(
                fontSize: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
