import "dart:typed_data";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:screenshot/screenshot.dart";
import "package:share/share.dart";

class ImagePreviewScreen extends StatelessWidget {
  ///ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  ///Getting ImagesPath
  final imagepath;
  ImagePreviewScreen(this.imagepath);
  @override
  Widget build(BuildContext context) {
    final Size s = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            "Image Preview",
            style: GoogleFonts.salsa(),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: s.height,
          width: s.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: s.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.file(
                          imagepath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Divider(),
                      MaterialButton(
                        onPressed: () async {
                          await share();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                                size: 25,
                              ),
                            ),
                            Text(
                              "Share",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void share() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List image) async {
      {
        /// Share Plugin
        await Share.shareFiles([imagepath.path]);
      }
    });
  }
}
