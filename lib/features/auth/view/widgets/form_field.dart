import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.controller, required this.label});
  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(decoration: InputDecoration(hintText: label));
  }
}
