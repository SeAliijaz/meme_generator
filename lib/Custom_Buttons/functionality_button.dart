import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

// ignore: must_be_immutable
class FunctionalityButtons extends StatelessWidget {
  ///Var
  String text;
  double iconSize;
  IconData icon;
  double fontsize;
  FontWeight fontWeight;
  Color iconColor;
  VoidCallback onPress;

  ///Const
  FunctionalityButtons({
    this.text,
    this.iconSize,
    this.icon,
    this.fontsize,
    this.fontWeight,
    this.iconColor,
    this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    final Size s = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 55,
          width: s.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Colors.black87,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                ),
              ),
              Center(
                child: Text(
                  "${text ?? "Text"}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.salsa(
                    textStyle: TextStyle(
                      fontSize: fontsize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
