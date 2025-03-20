// import 'package:flutter_music/model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final riverpodIsLight = StateProvider<bool>((ref) {
//   return true;
// });
//
// final riverpodIsDark = ChangeNotifierProvider<ThemeModel>((ref) {
//   return ThemeModel(isLight: false);
// });

import 'package:flutter_music/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final riverpodCounter = StateProvider((ref) => 0);
final riverpodIsLight = StateNotifierProvider((ref) {
  return ThemeModel();
});
