import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meme_generator/Custom_Buttons/custom_function_button.dart';

class MemeCreatorScreen extends StatefulWidget {
  ///final id
  static final id = '/MemeCreatorScreen';

  ///To recieve pic from HomeScreen
  File reciever;

  ///Const
  MemeCreatorScreen({this.reciever});

  @override
  State<MemeCreatorScreen> createState() => _MemeCreatorScreenState();
}

class _MemeCreatorScreenState extends State<MemeCreatorScreen> {
  ///Key
  final GlobalKey repaintKey = new GlobalKey();

  ///texts to make on Image
  String headerText = "";
  String footerText = "";

  ///Main Body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///Arrow back Icon
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                ///Image
                Container(
                  height: 150,
                  child: Image.asset('images/smiley3.png'),
                ),

                ///Page Header Text
                Center(
                  child: Text(
                    'Meme-Generator 😜',
                    style: GoogleFonts.lateef(
                      textStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                ///SizedBox
                SizedBox(height: 10),

                ///RepaintBoundry
                RepaintBoundary(
                  key: repaintKey,
                  child: Stack(
                    children: [
                      ///Image Shown
                      Container(
                        decoration: BoxDecoration(),
                        child: widget.reciever != null
                            ? Center(
                                child: Image.file(
                                  widget.reciever,
                                  height: 300,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : CircularProgressIndicator(),
                      ),

                      ///Text On Image
                      ///Header Text
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                headerText.toUpperCase(),
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
                            ),
                            Spacer(),

                            ///Text on Image
                            ///Footer Text
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  footerText.toUpperCase(),
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
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ///TextFiels
                ///HeaderText
                ///FooterText
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (v) {
                      setState(() {
                        headerText = v;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Header Text',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (v) {
                      setState(() {
                        footerText = v;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Footer Text',
                    ),
                  ),
                ),

                ///Buttons
                Row(
                  children: [
                    CustomFunctionalityButton(
                      text: 'Save to Gallery',
                    ),
                    CustomFunctionalityButton(
                      text: 'Share Image',
                    ),
                    CustomFunctionalityButton(
                      text: 'Select Image',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
