import 'package:flutter/material.dart';
import 'package:myactivities_extension/Src/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Activities',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
        ),
        primarySwatch: Colors.pink,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.pink
        ),
      ),
      home: Home(title:'My Activities'),
    );
  }
}