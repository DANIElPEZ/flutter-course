import 'package:flutter/material.dart';

class profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(height: 50,color: Colors.yellow),
          Container(height: 50,color: Colors.red),
          Container(height: 50,color: Colors.greenAccent)
        ]
    );
  }
}