import 'package:flutter/material.dart';

Widget CustomTextField(
  String hintText,
  Function onChanged,
) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "${hintText ?? "Hint-Text"}",
      ),
    ),
  );
}
