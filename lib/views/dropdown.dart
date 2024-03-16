import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  final String value;
  final String label;
  final List<String> items;
  final Function(String?) onChanged;

  const MyDropdown({
    super.key,
    required this.value,
    required this.label,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: label,
      ),
      child: DropdownButton(
        value: value,
        isDense: true,
        isExpanded: true,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        borderRadius: BorderRadius.circular(20),
        dropdownColor: Colors.grey[200],
        underline: Container(),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
