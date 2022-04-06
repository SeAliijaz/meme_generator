import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomFunctionalityButton extends StatelessWidget {
  ///Txt
  String text;
  Function onPress;
  IconData icn;

  ///Const
  CustomFunctionalityButton({
    this.text,
    this.onPress,
    this.icn,
  });

  ///main body
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextButton.icon(
            onPressed: onPress,
            icon: Icon(
              icn,
              color: Colors.black,
            ),
            label: Text(
              "${text}",
              style: GoogleFonts.lateef(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
