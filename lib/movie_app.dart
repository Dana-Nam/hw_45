import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: HomeScreen(),
    );
  }
}
