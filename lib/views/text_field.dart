import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final Function(String?) vlidator;
  final TextInputType keyboardType;
  final Function() onTap;
  final bool isReadOnly;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hint,
      required this.vlidator,
      required this.keyboardType,
      required this.onTap,
      required this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: false,
      autocorrect: false,
      controller: controller,
      validator: (value) => vlidator(value),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: label,
        hintText: hint,
      ),
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: isReadOnly,
      maxLines: 3,
      minLines: 1,
    );
  }
}
