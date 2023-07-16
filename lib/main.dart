import 'package:instagram_project/screens/splash.dart';
import 'package:flutter/material.dart';


main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'instagaram',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: const ScreenSpalsh());
  }
}
