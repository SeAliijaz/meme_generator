import "package:flutter/material.dart";

// ignore: must_be_immutable
class Header_Footer_Text_Widget extends StatelessWidget {
  ///var
  String text;

  ///const
  Header_Footer_Text_Widget({
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        "${text.toUpperCase() ?? "Text"}",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 26,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Colors.black87,
            ),
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 8.0,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
