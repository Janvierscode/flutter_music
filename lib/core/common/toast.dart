import 'package:flutter/material.dart';
import 'package:flutter_music/core/theme/app_pallete.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
    timeInSecForIosWeb: 2,
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Pallete.kGradient1,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
