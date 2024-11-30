import 'package:flutter/material.dart';
import 'description_place.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'review',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))
          ),
          backgroundColor: Color.fromARGB(255, 81, 167, 253)),
      body: Center(
        child: Column(
          children: [
            DescriptionPlace()
          ],
        ),
      ),
    );
  }
}
