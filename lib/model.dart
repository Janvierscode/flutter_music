// import 'package:flutter/material.dart';
//
// class ThemeModel extends ChangeNotifier {
//   ThemeModel({required this.isLight});
//
//   bool isLight;
//
//   void toggleTheme(bool newData) {
//     isLight = newData;
//     notifyListeners();
//   }
// }
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModel extends StateNotifier<bool> {
  ThemeModel() : super(true);

  void toggleTheme() {
    state = !state;
  }
}
