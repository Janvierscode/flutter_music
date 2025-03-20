// import 'package:flutter/material.dart';
// import 'package:flutter_music/riverpod_data.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class CounterApp extends ConsumerWidget {
//   const CounterApp({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Counter App')),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(riverpodIsDark).toggleTheme(true);
//               },
//               child: Icon(Icons.light_mode),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(riverpodIsDark).toggleTheme(false);
//               },
//               child: Icon(Icons.dark_mode),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_music/button_icon.dart';
import 'package:flutter_music/riverpod_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterApp extends ConsumerWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IconData icon =
        ref.watch(riverpodIsLight) ? Icons.light_mode : Icons.dark_mode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          'Counter App',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          ButtonIcon(
            onPressed: () {
              ref.read(riverpodIsLight.notifier).toggleTheme();
            },
            icon: Icon(icon),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ref.watch(riverpodCounter).toString(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 50,
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    foregroundColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  onPressed: () {
                    ref.read(riverpodCounter.notifier).state++;
                  },
                  child: Icon(Icons.add, size: 40),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    foregroundColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  onPressed: () {
                    ref.read(riverpodCounter.notifier).state--;
                  },
                  child: Icon(Icons.remove, size: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
