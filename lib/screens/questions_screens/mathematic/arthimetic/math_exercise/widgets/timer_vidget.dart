import 'package:flutter/material.dart';
import 'package:kids_brain/utils/app_colors.dart';
import 'package:kids_brain/widgets/font_style_widget.dart';

class TimerWidget extends StatefulWidget {
  int second;

  TimerWidget({Key? key, required this.second}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.second.toString().length == 1
          ? " ${widget.second}"
          : widget.second.toString(),
      style: fontSourceSansProW600(appcolor: AppColors.C_0BAC00)
                                .copyWith(
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                        ),
      textAlign: TextAlign.center,
    );
  }
}