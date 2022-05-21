import "package:flutter/material.dart";
import "package:meme_generator/Images_Screen/my_memes_screen.dart";
import "package:meme_generator/Initial_Screen/splash_screen.dart";
import "package:meme_generator/Main_Screens/first_screen.dart";
import "package:meme_generator/Main_Screens/home_screen.dart";
import "package:sizer/sizer.dart";

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
          title: "Meme Generator",

          /* light theme settings */
          theme: ThemeData(
            brightness: Brightness.light,

            ///For AppBar
            backgroundColor: Colors.black,
          ),

          /* dark theme settings */
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),

          /*
          ThemeMode.system to follow system theme, 
          ThemeMode.light for light theme, 
          ThemeMode.dark for dark theme
          */
          themeMode: ThemeMode.system,

          ///debugShowCheckedModeBanner
          debugShowCheckedModeBanner: false,

          ///Home
          home: SplashScreen(),

          ///routes
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            FirstScreen.id: (context) => FirstScreen(),
            MyMemesScreen.id: (context) => MyMemesScreen(),
          },
        );
      }),
    );
  }
}
