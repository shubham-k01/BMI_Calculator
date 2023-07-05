import 'package:flutter/material.dart';
import 'screens/inputPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0A0E21)
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21)
      ),
      title: 'Flutter Demo',
      //We can add a theme for the entire app from here or
      // otherwise we can assign different themes for different widgets which provides with more granular control.
      //We can change multiple properties like font color, bg color in ThemeData


      // If we want to use some pre-existing styling from the predefined themes
      // and also want to add on some more of our own styling we can use copyWith method
      // ThemeData.dark().copyWith(
      //   primaryColor: Colors.black
      // ),
      home: const BMIHome(),
    );
  }
}








