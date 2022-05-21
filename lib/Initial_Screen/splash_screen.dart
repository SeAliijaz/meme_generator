import "dart:async";
import "package:flutter/material.dart";
import "package:meme_generator/Main_Screens/first_screen.dart";

class SplashScreen extends StatefulWidget {
  ///Final id
  static final String id = "/SplashScreen";
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
      Duration(seconds: 2),
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
    final Size s = MediaQuery.of(context).size;
    return Scaffold(
      ///theme
      body: Container(
        height: s.height,
        width: s.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ///Meme Generator logo
              Image.asset(
                "images/memegenrator-removebg-preview.png",
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
