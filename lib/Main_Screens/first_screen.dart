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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/smiley1.png',
                  ),
                  SizedBox(height: 10),

                  ///Custom Button 1
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                    child: CustomButton(
                      txt: 'Make Memes',
                      clr: Colors.blue,
                    ),
                  ),

                  ///Custom Button 1
                  GestureDetector(
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
        ));
  }
}
