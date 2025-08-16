import 'package:flutter/material.dart';
import 'package:movies_starter/screens/movies_screen.dart';
import 'package:movies_starter/view_model/app_brain.dart';

// Global scope
final appBrain = AppBrain();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: appBrain.isDark,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDark
              ? ThemeData.dark().copyWith(
                  colorScheme: ColorScheme.dark(
                    surface: Colors.grey.shade900,
                  ),
                )
              : ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light(
                    surface: Colors.grey.shade300,
                  ),
                ),
          home: const MoviesScreen(),
        );
      },
    );
  }
}
