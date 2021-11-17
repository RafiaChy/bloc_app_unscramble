import 'package:flutter/material.dart';

import 'package:rafia_unscramble_demo/ui/screens/text_input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unscramble',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextInputScreen(), //The First Screen of the app
    );
  }
}
