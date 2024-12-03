import 'package:flutter/material.dart';
import 'gradientBack.dart';
import 'ImageListPlaces.dart';

class headerAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        gradientBack(),
        imagePlaces()
      ],
    );
  }
}