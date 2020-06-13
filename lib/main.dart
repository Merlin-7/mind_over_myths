import 'package:flutter/material.dart';
import 'package:mind_over_myths/mind_over_myths/screen/pages/Homepage.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
