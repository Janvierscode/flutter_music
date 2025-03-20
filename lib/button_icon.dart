import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonIcon extends ConsumerWidget {
  const ButtonIcon({super.key, required this.onPressed, required this.icon});
  final Icon icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context, ref) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: IconButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
