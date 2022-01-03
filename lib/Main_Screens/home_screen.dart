import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meme_generator/Carousel_Slider/carousel_categories.dart';
import 'package:meme_generator/Custom_Button/expandable_button.dart';

class HomeScreen extends StatelessWidget {
  ///Final id
  static final id = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandableFloatingActionButton(),
      body: Stack(
        children: [
          ///BackGround Image
          Image.asset(
            'images/bg1.jpg',
            fit: BoxFit.fitHeight,
            height: double.infinity,
            width: double.infinity,
          ),

          ///For Blur BG
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 30,
              sigmaY: 30,
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///SizedBox
                  SizedBox(height: 45),

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
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Meme-Generator',
                      style: GoogleFonts.lateef(
                          textStyle: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                    ),
                  ),

                  ///Text 2
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Make Your Faviroute Memes',
                      style: GoogleFonts.lateef(
                          textStyle: TextStyle(
                        fontSize: 30,
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
        ],
      ),
    );
  }
}
