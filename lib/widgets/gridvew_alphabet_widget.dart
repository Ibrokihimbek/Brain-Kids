import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_brain/service/shuffle.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/utils/app_loties.dart';
import 'package:kids_brain/utils/app_routes.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';
import 'package:lottie/lottie.dart';

class GridvewAlphabetsWidget extends StatefulWidget {
  List alphabets;
  String letter;
  String constantLetter;
  var alphabetModel;
  String lastLetter;
  GridvewAlphabetsWidget({
    super.key,
    required this.alphabets,
    required this.letter,
    required this.alphabetModel,
    required this.lastLetter,
    required this.constantLetter,
  });

  @override
  State<GridvewAlphabetsWidget> createState() => _GridvewAlphabetsWidgetState();
}

class _GridvewAlphabetsWidgetState extends State<GridvewAlphabetsWidget> {
  @override
  Widget build(BuildContext context) {
    String firstLetter = widget.constantLetter;
    return GridView.builder(
      shrinkWrap: true,
      itemCount: widget.alphabets.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return englishAlphabetlist(widget.alphabets[index], firstLetter);
      },
    );
  }

  Widget englishAlphabetlist(alphabet, String frisLetter) {
    return Padding(
      padding: const EdgeInsets.all(6).r,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.height * 0.04.h,
        ),
        onTap: () async {
          if (alphabet.letter == widget.letter) {
            print(widget.letter);

            alphabet.onSelected = true;
            int fromascii = widget.letter == 'ب'
                ? (widget.letter.codeUnitAt(0) + 2)
                : widget.letter == 'غ'
                    ? (widget.letter.codeUnitAt(0) + 7)
                    : widget.letter == 'و'
                        ? (widget.letter.codeUnitAt(0) + 2)
                        : widget.letter.codeUnitAt(0) == 1045
                            ? (widget.letter.codeUnitAt(0) - 20)
                            : widget.letter.codeUnitAt(0) == 1025
                                ? (widget.letter.codeUnitAt(0) + 21)
                                : (widget.letter.codeUnitAt(0) + 1);
            widget.letter = String.fromCharCode(fromascii);
            print(frisLetter);
            print(widget.letter);
            if (widget.letter == widget.lastLetter) {
              print(widget.letter);
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
                      Lottie.asset(AppLoties.lotieCongratulation),
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
                        widget.letter = frisLetter;
                        setState(
                          () {
                            Navigator.pop(context);
                          },
                        );
                        widget.alphabets = shuffle(widget.alphabetModel);
                        for (var element in widget.alphabets) {
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
            alphabet.onSelected = false;
            setState(() {});

            widget.letter = frisLetter;
            await Future.delayed(const Duration(milliseconds: 800));

            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) => CupertinoAlertDialog(
                title: Text(
                  "Game over".tr(),
                  style: fontSourceSansProW600(appcolor: AppColors.C_2855AE),
                ),
                content: Lottie.asset(AppLoties.lotieCry),
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
                      widget.alphabets = shuffle(widget.alphabetModel);
                      for (var element in widget.alphabets) {
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
          width: MediaQuery.of(context).size.width * 0.199.w,
          height: MediaQuery.of(context).size.height * 0.1.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.height * 0.04.h,
            ),
            color: alphabet.onSelected == null
                ? AppColors.C_FDC642
                : alphabet.onSelected!
                    ? AppColors.C_0BAC00
                    : AppColors.C_E92020,
          ),
          child: Center(
            child: Text(
              alphabet.letter,
              style:
                  fontSourceSansProW600(appcolor: AppColors.C_FFFFFF).copyWith(
                fontSize: MediaQuery.of(context).size.height * 0.05.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
