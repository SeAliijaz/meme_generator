import 'dart:async';
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
      ///theme
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ///Meme Generator logo
              Image.asset(
                'images/memegenrator-removebg-preview.png',
              ),
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
