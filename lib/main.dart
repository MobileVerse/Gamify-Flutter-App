import 'package:flutter/material.dart';
import 'package:gamify_app/pages/home_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gamify App',
      theme: ThemeData(brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}
