import 'package:flutter/material.dart';
import 'package:game_of_taps/pages/GamePage.dart';
import 'package:game_of_taps/pages/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Of Taps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Akaya_Telivigala",
        // scaffoldBackgroundColor: Color(0xffFFD700),
      ),
      home: Home(),
      routes: {
        "/game": (context) => GamePage(),
      },
    );
  }
}
