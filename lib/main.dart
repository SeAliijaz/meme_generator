import 'package:flutter/material.dart';
import 'package:meme_generator/Initial_Screen/splash_screen.dart';
import 'package:meme_generator/Main_Screens/first_screen.dart';
import 'package:meme_generator/Main_Screens/home_screen.dart';
import 'package:meme_generator/Meme-Generator/meme_creator.dart';
import 'package:meme_generator/Meme-Generator/memes_saver.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///title
      title: 'Meme-Generator',

      ///DebugShowCheckedModeBanner
      debugShowCheckedModeBanner: false,

      ///Theme
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.blue,
      ),

      ///theme will be saved as system has
      themeMode: ThemeMode.system,

      ///Home
      home: SplashScreen(),

      ///routes
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        FirstScreen.id: (context) => FirstScreen(),
        MemeCreatorScreen.id: (context) => MemeCreatorScreen(),
        MyMemesSaver.id: (context) => MyMemesSaver(),
        // SplashScreen.id:(context)=> SplashScreen(),
        // SplashScreen.id:(context)=> SplashScreen(),
        // SplashScreen.id:(context)=> SplashScreen(),
        // SplashScreen.id:(context)=> SplashScreen(),
        // SplashScreen.id:(context)=> SplashScreen(),
        // SplashScreen.id:(context)=> SplashScreen(),
        // SplashScreen.id:(context)=> SplashScreen(),
        // SplashScreen.id:(context)=> SplashScreen(),
      },
    );
  }
}
