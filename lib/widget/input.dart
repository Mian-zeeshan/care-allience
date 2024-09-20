import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input(
      {super.key,
      required this.label,
      required this.hint,
      required this.prefixIcon,
      required this.controller});

  final String label;
  final String hint;
  final IconData prefixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        prefixIcon: Icon(prefixIcon),
        labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
