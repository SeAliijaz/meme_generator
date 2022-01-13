import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFunctionalityButton extends StatelessWidget {
  ///Txt
  String text;
  Function onPress;
  Color clr;

  ///Const
  CustomFunctionalityButton({
    this.text,
    this.onPress,
    this.clr,
  });

  ///main body
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            decoration: BoxDecoration(
              color: clr,
              borderRadius: BorderRadius.circular(50),
            ),
            height: 60,
            child: Center(
              child: Text(
                "${text}",
                style: GoogleFonts.lateef(
                  textStyle: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
