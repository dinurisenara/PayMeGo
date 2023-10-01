import 'package:flutter/material.dart';
import 'package:paymego/screens/login.dart';
import 'package:paymego/themes/darkTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PayMeGo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const Login(),
    );
  }
}
