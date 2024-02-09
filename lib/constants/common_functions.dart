import 'package:flutter/cupertino.dart';

class CommonFunction{
  static blankSpace(double? height,double? width){
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
    );
  }
}