import "dart:io";
import "dart:typed_data";
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:image_picker/image_picker.dart";
import "package:meme_generator/Constants/constants.dart";
import 'package:meme_generator/Custom_Buttons/functionality_button.dart';
import "package:meme_generator/Widgets/header_footer_texts.dart";
import "package:meme_generator/Widgets/text_field.dart";
import "package:meme_generator/Widgets/text_widget.dart";
import "package:path_provider/path_provider.dart";
import "package:screenshot/screenshot.dart";
import "package:share/share.dart";

class HomeScreen extends StatefulWidget {
  ///Final id
  static final String id = "/HomeScreen";

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
          toast("No Image Selected");
        }
      });
    } catch (e) {
      toast(e.toString());
    }
  }

  ///Method Image Picker from Gallery
  _imagePickerFromCamera() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        if (pick != null) {
          _image = File(pick.path);
        } else {
          toast("No Image Selected");
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
    final Size s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: _image == null
            ? AppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                title: Text(
                  "Select image to make meme",
                  style: GoogleFonts.salsa(),
                ),
                centerTitle: true,
              )
            : AppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                title: Text(
                  "Make Your meme".toUpperCase(),
                  style: GoogleFonts.salsa(),
                ),
                centerTitle: true,
              ),

        ///Body
        body: Container(
          height: s.height,
          width: s.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///No Image
                if (_image == null) ImageDisappearing() else SizedBox(),

                ///Image Will be Shown
                if (_image != null) ImageShown(context) else SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

/**********************************
 * The Part where no image is shown
***********************************/
  Widget ImageDisappearing() {
    final Size s = MediaQuery.of(context).size;
    return Container(
      height: s.height * 0.70,
      width: s.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///SMILEY
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/smiley1.png"),

                ///TEXTS
                CustomTextWidget(
                  title: "Meme-Generator",
                  size: 40.0,
                  fontWeight: FontWeight.bold,
                ),
                CustomTextWidget(
                  title: "Make Your Faviroute Memes",
                  size: 35.0,
                ),
              ],
            ),

            ///Buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: FunctionalityButtons(
                        text: "From Gallery",
                        icon: Icons.photo,
                        iconColor: Colors.black,
                        fontsize: 20,
                        onPress: () {
                          _imagePickerFromGallery();
                        },
                      ),
                    ),
                    Expanded(
                      child: FunctionalityButtons(
                        text: "From Camera",
                        icon: Icons.camera_alt,
                        iconColor: Colors.black,
                        fontsize: 20,
                        onPress: () {
                          _imagePickerFromCamera();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

/**********************************
 * The Part where we show the image after selection
***********************************/
  Widget ImageShown(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
            title: "Meme-Generator",
            size: 40.0,
            fontWeight: FontWeight.bold,
          ),
          CustomTextWidget(
            title: "Make Your Faviroute Memes",
            size: 35.0,
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          SizedBox(height: 5),
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
                              height: 350,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Center(
                            child: Text(
                              "No Image Selected",
                              style: GoogleFonts.salsa(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                  ),

                  ///Text On Image
                  ///Header Text
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        /**************
                         * Header Text
                        **************/
                        Header_Footer_Text_Widget(
                          text: "${headerText}",
                        ),

                        ///Spacer
                        Spacer(),

                        /**************
                         * Footer Text
                        **************/
                        Header_Footer_Text_Widget(
                          text: "${footerText}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            child: CustomTextField(
              "Header Text",
              (v) {
                setState(() {
                  headerText = v;
                });
              },
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
            child: CustomTextField(
              "Footer Text",
              (v) {
                setState(() {
                  footerText = v;
                });
              },
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: FunctionalityButtons(
                  text: "Save to Gallery",
                  icon: Icons.save_alt,
                  fontsize: 17,
                  onPress: () {
                    save();
                  },
                ),
              ),
              Expanded(
                child: FunctionalityButtons(
                  text: "Share Image",
                  icon: Icons.share,
                  fontsize: 17,
                  onPress: () {
                    share();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///Save function
  void save() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List image) async {
      if (image != null) {
        List<Directory> directory = await getExternalStorageDirectories();
        String d = DateTime.now().microsecondsSinceEpoch.toString();

        ///Image path where image will be stored in mobile
        final imagePath =
            await File("/storage/emulated/0/Download/$d.jpg").create();
        await imagePath
            .writeAsBytes(image)
            .whenComplete(
              () => print("Image Saved Successfully!"),
            )
            .whenComplete(() => toast("Image Saved Successfully!"))
            .catchError((e) {
          print(e.toString());
          toast(e.toString());
        });
        print(imagePath);
      }
    });
  }

  ///Share function
  void share() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        String d = DateTime.now().microsecondsSinceEpoch.toString();
        final imagePath = await File("${directory.path}/image$d.png").create();
        await imagePath.writeAsBytes(image);

        /// Share Plugin
        await Share.shareFiles([imagePath.path]);
      }
    });
  }
}
