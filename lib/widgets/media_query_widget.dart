import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppWidth({required context, required num size}) {
  return MediaQuery.of(context).size.width * size.w;
}

AppHeight({required context, required num size}) {
  return MediaQuery.of(context).size.height * size.h;
}
