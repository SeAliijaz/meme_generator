import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  String txt;
  Color clr;

  CustomButton({this.txt, this.clr});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          txt,
          style: GoogleFonts.lateef(
              textStyle: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
    );
  }
}
