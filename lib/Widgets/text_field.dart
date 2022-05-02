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
        border: InputBorder.none,
        hintText: "${hintText ?? "Hint-Text"}",
      ),
    ),
  );
}
