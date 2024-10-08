import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showFlutterToast(
    {required String msg,
    Color backGroundColor = Colors.red,
    Color textColor = Colors.white,
    double fontSize = 16}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: backGroundColor,
    textColor: textColor,
    fontSize: fontSize.sp,
  );
}
