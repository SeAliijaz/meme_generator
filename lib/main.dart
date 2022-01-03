import 'package:flutter/material.dart';
import 'package:meme_generator/home_screen.dart';

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
      theme: ThemeData(),

      ///Home
      home: HomeScreen(),

      ///routes
      routes: {},
    );
  }
}
