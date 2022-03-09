import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meme_generator/Constants/constants.dart';
import 'package:meme_generator/Custom_Buttons/custom_function_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  ///Final id
  static final id = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///File image
  File _image;

  ///object  of Image picker
  final picker = ImagePicker();

  ///Method Image Picker from Gallery
  _imagePickerFromGallery() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pick != null) {
          _image = File(pick.path);
        } else {
          toast('No Image Selected');
        }
      });
    } catch (e) {
      toast(e.toString());
    }
  }

  ///Key
  final GlobalKey repaintKey = new GlobalKey();

  ///Screenshot
  ScreenshotController screenshotController = ScreenshotController();

  ///texts to make on Image
  String headerText = "";
  String footerText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.image),
          onPressed: () {
            _imagePickerFromGallery();
          }),

      ///Body
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ],
                ),
              ),

              ///No Image
              if (_image == null) ImageDisappearing() else SizedBox(),

              ///Image Will be Shown
              if (_image != null) ImageShown(context) else SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Column ImageDisappearing() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Meme-Generator',
            style: GoogleFonts.lateef(
                textStyle: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Make Your Faviroute Memes',
            style: GoogleFonts.lateef(
                textStyle: TextStyle(
              fontSize: 35.0,
            )),
          ),
        ),
      ],
    );
  }

  Column ImageShown(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Meme-Generator',
            style: GoogleFonts.lateef(
                textStyle: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Make Your Faviroute Memes',
            style: GoogleFonts.lateef(
                textStyle: TextStyle(
              fontSize: 35.0,
            )),
          ),
        ),
        RepaintBoundary(
          key: repaintKey,
          child: Screenshot(
            controller: screenshotController,
            child: Stack(
              children: [
                ///Image Shown
                Container(
                  decoration: BoxDecoration(),
                  child: _image != null
                      ? Center(
                          child: Image.file(
                            _image,
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
                        child: Text(
                          "${headerText}".toUpperCase(),
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

                      ///Spacer
                      Spacer(),

                      ///Text on Image
                      ///Footer Text
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "${footerText}".toUpperCase(),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(12.0),
            child: TextFormField(
              onChanged: (v) {
                setState(() {
                  headerText = v;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: TextFormField(
            onChanged: (v) {
              setState(() {
                footerText = v;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Row(
          children: [
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
          ],
        ),
      ],
    );
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
