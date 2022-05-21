import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class CustomButton extends StatelessWidget {
  ///For Color
  ///Text
  String text;

  ///Const
  CustomButton({
    this.text,
  });

  ///Main Body
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
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
              "${text ?? "Text"}",
              textAlign: TextAlign.center,
              style: GoogleFonts.salsa(
                textStyle: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
