import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFunctionalityButton extends StatelessWidget {
  ///Txt
  String text;

  ///Const
  CustomFunctionalityButton({this.text});

  ///main body
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          height: 60,
          child: Center(
            child: Text(
              "${text}",
              style: GoogleFonts.lateef(
                textStyle: TextStyle(
                  fontSize: 20.0,
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
