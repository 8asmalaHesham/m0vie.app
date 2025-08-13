import 'package:flutter/material.dart';
import 'package:movies_starter/screens/movies_screen.dart';
import 'package:movies_starter/view_model/app_brain.dart';

//global scope
final appBrain = AppBrain();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MoviesScreen()
    );
  }
}
