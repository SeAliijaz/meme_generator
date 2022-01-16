import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meme_generator/Constants/constants.dart';
import 'package:meme_generator/Custom_Buttons/custom_function_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

// ignore: must_be_immutable
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

  ///Screenshot
  ScreenshotController screenshotController = ScreenshotController();

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
                    child: Column(children: [
      ///Arrow back Icon
      Container(
          child: Row(children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ))
      ])),

      ///Page Header Text
      Center(
          child: Text('Meme_Generator 😜',
              style: GoogleFonts.lateef(
                  textStyle: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )))),

      ///SizedBox
      SizedBox(height: 10),

      ///RepaintBoundry
      RepaintBoundary(
          key: repaintKey,
          child: Screenshot(
            controller: screenshotController,
            child: Stack(children: [
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
                    : SizedBox(),
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
                            child: Text("${headerText}".toUpperCase(),
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
                                      )
                                    ]))),

                        ///Spacer
                        Spacer(),

                        ///Text on Image
                        ///Footer Text
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text("${footerText}".toUpperCase(),
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
                                      )
                                    ])))
                      ]))
            ]),
          )),

      ///Divider
      Divider(
        color: Colors.grey,
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
              hintText: 'Write 1st Text Here',
            ),
          )),
      Padding(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
              onChanged: (v) {
                setState(() {
                  footerText = v;
                });
              },
              decoration: InputDecoration(
                labelText: 'Write 2nd Text Here',
              ))),

      ///Buttons
      Row(children: [
        CustomFunctionalityButton(
          text: 'Save to Gallery',
          icn: Icons.save_alt,
          onPress: () {
            save();
          },
        ),
        CustomFunctionalityButton(
          text: 'Share Image',
          icn: Icons.share,
          onPress: () {
            share();
          },
        ),
      ])
    ])))));
  }

  ///Save function
  void save() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List image) async {
      if (image != null) {
        // ignore: unused_local_variable
        List<Directory> directory = await getExternalStorageDirectories();
        String d = DateTime.now().microsecondsSinceEpoch.toString();

        final imagePath =
            await File('/storage/emulated/0/Download/$d.jpg').create();
        await imagePath
            .writeAsBytes(image)
            .whenComplete(() => toast('Image Saved Successfully!'))
            .catchError((e) {
          print(e.toString());
        });
        print(imagePath);
      }
    });
  }

  ///Share Function
  void share() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        String d = DateTime.now().microsecondsSinceEpoch.toString();

        final imagePath = await File('${directory.path}/image$d.png').create();
        await imagePath.writeAsBytes(image);

        ///Share
        await Share.shareFiles([imagePath.path]);
      }
    });
  }
}
