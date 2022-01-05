import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meme_generator/Main_Screens/first_screen.dart';

class SplashScreen extends StatefulWidget {
  ///Final id
  static final id = '/SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ///Var for timer
  Timer _timer;

  ///initializing timer
  @override
  void initState() {
    _timer = Timer(
      Duration(seconds: 5),
      () async {
        await Navigator.pushReplacementNamed(
          context,
          FirstScreen.id,
        );
      },
    );
    super.initState();
  }

  ///Disposing Timer
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueAccent,
        child: Stack(
          children: [
            Image.asset(
              'images/bg1.jpg',
              fit: BoxFit.fitHeight,
              height: double.infinity,
              width: double.infinity,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'images/memelogo2.png',
                    ),
                    CircularProgressIndicator(
                      strokeWidth: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
