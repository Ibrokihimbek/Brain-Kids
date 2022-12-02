import 'package:flutter/cupertino.dart';

num queryWidth(context){
  return MediaQuery.of(context).size.width;
}
num queryHeight(context){
  return MediaQuery.of(context).size.height;
}