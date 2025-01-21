import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield(
      {super.key,
      required this.label,
      required this.controller,
      required this.onChanged});
  final String label;
  final TextEditingController controller;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(label),
      ),
      controller: controller,
      onChanged: onChanged,
    );
  }
}
