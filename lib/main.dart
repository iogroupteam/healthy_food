import 'package:flutter/material.dart';
import 'package:food/View/Pages/splash.dart';

import 'View/Pages/startPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      theme: ThemeData(fontFamily: 'AM'),
    );
  }
}
