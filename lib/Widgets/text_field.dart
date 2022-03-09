import 'package:flutter/material.dart';

Widget CustomTextField(
  String hintText,
  Function onChanged,
) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: "${hintText ?? "Hint-Text"}",
        ),
      ),
    ),
  );
}
