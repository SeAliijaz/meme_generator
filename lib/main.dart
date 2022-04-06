import 'package:flutter/material.dart';
import 'package:meme_generator/Initial_Screen/splash_screen.dart';
import 'package:meme_generator/Main_Screens/first_screen.dart';
import 'package:meme_generator/Main_Screens/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          ///title
          title: 'Meme-Generator',

          /* light theme settings */
          theme: ThemeData(
            brightness: Brightness.light,
          ),

          /* dark theme settings */
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),

          /*ThemeMode.system to follow system theme, 
      ThemeMode.light for light theme, 
      ThemeMode.dark for dark theme*/
          themeMode: ThemeMode.light,

          ///debugShowCheckedModeBanner
          debugShowCheckedModeBanner: false,

          ///Home
          home: SplashScreen(),

          ///routes
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            FirstScreen.id: (context) => FirstScreen(),
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
      }),
    );
  }
}
