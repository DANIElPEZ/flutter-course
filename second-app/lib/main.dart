import 'package:flutter/material.dart';
import 'views/mainContainer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: reviewPlaces(), debugShowCheckedModeBanner: false);
  }
}