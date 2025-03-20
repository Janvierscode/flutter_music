// import 'package:flutter/material.dart';
// import 'package:flutter_music/counter_app.dart';
// import 'package:flutter_music/riverpod_data.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// void main() {
//   runApp(ProviderScope(child: const MyApp()));
// }
//
// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     Brightness brightness =
//         ref.watch(riverpodIsDark).isLight ? Brightness.light : Brightness.dark;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.deepPurple,
//           brightness: brightness,
//         ),
//       ),
//       home: const CounterApp(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_music/core/theme/theme.dart';
import 'package:flutter_music/features/home/view/pages/signup_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Brightness brightness =
    //     ref.watch(riverpodIsLight) ? Brightness.light : Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.kDarkThemeMode,
      home: SignupPage(),
    );
  }
}
