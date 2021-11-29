import 'package:binarytask/home.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          backgroundColor: Colors.black,
          brightness: Brightness.dark),
      home: const Home(),
    );
  }
}
