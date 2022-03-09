import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  ///Var
  String title;
  double size;
  FontWeight fontWeight;

  ///Const
  CustomTextWidget({
    this.title,
    this.size,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    ///final size
    final Size s = MediaQuery.of(context).size;

    return Container(
      width: s.width,
      child: Center(
        child: Text(
          "${title ?? "Title"}",
          textAlign: TextAlign.center,
          style: GoogleFonts.lateef(
            textStyle: TextStyle(
              fontSize: size,
              fontWeight: fontWeight,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
