import 'package:estructura_practica_1/login/login.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:estructura_practica_1/login/prelogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: ACCENT_COLOR,
          backgroundColor: Colors.white,
          accentColor: ACCENT_COLOR),
      home: Splash2(),
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new SecondScreen(),
      backgroundColor: Colors.brown,
      image: Image.asset('assets/images/cupping.png'),
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      theme: ThemeData(
          primarySwatch: PRIMARY_COLOR,
          backgroundColor: Colors.white,
          accentColor: Colors.white,
          cardColor: ACCENT_COLOR,
          canvasColor: Colors.white,
          textTheme: TextTheme(
              body1: TextStyle(
            color: TEXT_COLOR,
            fontFamily: 'AkzidenzGrotesk',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ))),
      home: Prelogin(),
    );
  }
}
