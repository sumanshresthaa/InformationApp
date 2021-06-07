import 'package:all_in_information/Screens/cryptonews.dart';
import 'package:all_in_information/Weather/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:all_in_information/Screens/home.dart';
import 'package:all_in_information/Screens/quizpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => LoadingScreen(),
       // '/home' : (context) => HomeScreen(),
        '/crypto': (context) => CryptoNews(),
        '/quiz' : (context) => QuizScreen(),
      },

    );
  }
}
