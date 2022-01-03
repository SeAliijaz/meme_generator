import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meme_generator/Custom_Button/custom_button.dart';
import 'package:meme_generator/Main_Screens/home_screen.dart';

class FirstScreen extends StatelessWidget {
  static final id = '/FirstScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                    child: CustomButton(
                      txt: 'Make Memes',
                      clr: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
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
    ));
  }
}
