import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMemesSaver extends StatelessWidget {
  static final id = '/MyMemesSaver';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Memes"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Work on this page is pending...',
              style: GoogleFonts.lateef(
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
