import "dart:io";
import "package:ext_storage/ext_storage.dart";
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:meme_generator/Images_Screen/image_preview_screen.dart";
import "package:permission_handler/permission_handler.dart";

class MyMemesScreen extends StatefulWidget {
  static final String id = "/MyMemesScreen";
  @override
  _MyMemesScreenState createState() => _MyMemesScreenState();
}

class _MyMemesScreenState extends State<MyMemesScreen> {
  Future _futureGetPath;
  List<dynamic> listImagePath = List<dynamic>();
  var _permissionStatus;

  @override
  void initState() {
    super.initState();
    _listenForPermissionStatus();

    _futureGetPath = _getPath();
  }

  @override
  Widget build(BuildContext context) {
    final Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "MY Memes".toUpperCase(),
          style: GoogleFonts.salsa(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: s.height,
          width: s.width,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: FutureBuilder(
                  future: _futureGetPath,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var dir = Directory(snapshot.data);
                      print("permission status: $_permissionStatus");
                      if (_permissionStatus) _fetchFiles(dir);
                      return Text("");
                    } else {
                      return Center(
                          child: Text(
                        "Loading...",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ));
                    }
                  },
                ),
              ),
              Expanded(
                flex: 100,
                child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  crossAxisCount: 2,
                  children: _getListImg(listImagePath),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenForPermissionStatus() async {
    final status = await Permission.storage.request().isGranted;
    setState(() {
      _permissionStatus = status;
    });
  }

  Future<String> _getPath() {
    return ExtStorage.getExternalStoragePublicDirectory(
        ExtStorage.DIRECTORY_DOWNLOADS);
  }

  _fetchFiles(Directory dir) {
    List<dynamic> listImage = List<dynamic>();
    dir.list().forEach((element) {
      RegExp regExp =
          new RegExp("\.(gif|jpe?g|tiff?|png|webp|bmp)", caseSensitive: false);
      if (regExp.hasMatch("$element")) listImage.add(element);
      setState(() {
        listImagePath = listImage;
      });
    });
  }

  List<Widget> _getListImg(List<dynamic> listImagePath) {
    List<Widget> listImages = List<Widget>();
    for (var imagePath in listImagePath) {
      listImages.add(
        Container(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return ImagePreviewScreen(imagePath);
                  });
            },
            child: Image.file(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
    return listImages;
  }
}
