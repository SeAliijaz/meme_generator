import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meme_generator/Custom_Buttons/custom_button.dart';
import 'package:meme_generator/Main_Screens/home_screen.dart';

class FirstScreen extends StatelessWidget {
  ///Final id
  static final id = '/FirstScreen';

  ///Main Body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Stack(
          children: [
            Image.asset(
              'images/bg2.jpg',
              fit: BoxFit.fitHeight,
              height: double.infinity,
              width: double.infinity,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7,
                sigmaY: 7,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/smiley1.png',
                    ),
                    SizedBox(height: 10),

                    ///Custom Button 1
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                      child: CustomButton(
                        txt: 'Make Memes',
                        clr: Colors.blue,
                      ),
                    ),

                    ///SizedBox
                    SizedBox(height: 10),

                    ///Custom Button 1
                    InkWell(
                      onTap: () {},
                      child: CustomButton(
                        txt: 'My Memes',
                        clr: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
