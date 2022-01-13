import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meme_generator/Carousel_Slider/carousel_categories.dart';
import 'package:meme_generator/Constants/constants.dart';
import 'package:meme_generator/Meme-Generator/meme_creator.dart';

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
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return MemeCreatorScreen(
              reciever: _image,
            );
          }));
        } else {
          toast('No Image Selected');
        }
      });
    } catch (e) {
      toast(e.toString());
    }
  }

  ///Method Image picker from Camera
  _imagePickerFromCamera() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        if (pick != null) {
          _image = File(pick.path);
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return MemeCreatorScreen(
              reciever: _image,
            );
          }));
        } else {
          toast('No Image Selected');
        }
      });
    } catch (e) {
      toast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///floatingActionButton
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        foregroundColor: Colors.white,
        visible: true,
        closeManually: false,
        curve: Curves.ease,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        elevation: 10,
        shape: StadiumBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.camera_alt),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.black,
            label: 'Camera',
            labelStyle: TextStyle(fontSize: 15.0),
            onTap: () {
              _imagePickerFromCamera();
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.photo),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.black,
            label: 'Gallery',
            labelStyle: TextStyle(fontSize: 15.0),
            onTap: () {
              _imagePickerFromGallery();
            },
          ),
        ],
      ),

      ///Body
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Container for Arrow Back
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

              ///Image 1
              Center(
                child: Image.asset(
                  'images/smiley2.png',
                ),
              ),

              ///Text 1
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

              ///Text 2
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

              ///Sized Box
              SizedBox(height: 15),

              ///Carousel Slider
              CarouselSlider.builder(
                itemCount: carousel.length,
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  initialPage: 0,
                ),
                itemBuilder: (c, index, j) {
                  return Container(
                    child: Image(
                      image: CachedNetworkImageProvider(
                        carousel[index].images,
                      ),
                      fit: BoxFit.fitHeight,
                      width: double.infinity,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
