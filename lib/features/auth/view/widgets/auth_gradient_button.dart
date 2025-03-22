import 'package:flutter/material.dart';
import 'package:flutter_music/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({
    super.key,
    required this.widget,
    required this.onTap,
  });
  final Widget widget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Pallete.kGradient1, Pallete.kGradient2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Pallete.kTransparentColor,
          shadowColor: Pallete.kTransparentColor,
        ),
        onPressed: onTap,
        child: widget,
        // child: Text(
        //   buttonText,
        //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        // ),
      ),
    );
  }
}
