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

  Widget numbersList(number, int fristNumbers) {
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
              showDialogWidget(
                congratulations: 'Congratulations',
                lottie: AppLoties.lottieWin,
                winOrdefeat: 'You have won',
                firstNumber: fristNumbers,
                context: context,
              );
            }
          } else {
            number.onSelected = false;
            setState(() {});

            // widget.numbers = fristNumbers;
            await Future.delayed(const Duration(milliseconds: 800));

            showDialogWidget(
              congratulations: '',
              lottie: AppLoties.lottieCryBear,
              winOrdefeat: 'Game over',
              context: context,
              firstNumber: fristNumbers,
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

  Future<dynamic> showDialogWidget(
      {required String winOrdefeat,
      required String lottie,
      required String congratulations,
      required BuildContext context,
      required int firstNumber}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(
          winOrdefeat.tr(),
          style: fontSourceSansProW600(appcolor: AppColors.C_2855AE),
        ),
        content: Column(
          children: [
            Lottie.asset(lottie),
            Text(
              congratulations.tr(),
              style: fontSourceSansProW600(appcolor: AppColors.C_2855AE),
            ),
          ],
        ),
        actions: [
          showDialogButton(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, RoutName.home, (route) => false);
            },
            word: "Return to the main page".tr(),
          ),
          showDialogButton(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, RoutName.numbers, (route) => false);
            },
            word: 'Back to the math page'.tr(),
          ),
          showDialogButton(
            onTap: () {
              widget.numbers = firstNumber;
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
            word: "Try again".tr(),
          )
        ],
      ),
    );
  }

  TextButton showDialogButton(
      {required VoidCallback onTap, required String word}) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        child: Text(
          word,
          style: fontSourceSansProW400(appcolor: AppColors.C_000000),
        ),
      ),
    );
  }
}
