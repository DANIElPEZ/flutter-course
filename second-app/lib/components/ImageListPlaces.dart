import 'package:flutter/material.dart';
import 'cardImage.dart';

class imagePlaces extends StatelessWidget {
  final List places = [
    "asset/image/mountEverest.jpg",
    "asset/image/sintMaarten.jpg",
    "asset/image/machuPicchu.jpg",
    "asset/image/blueAngels.jpg",
    "asset/image/aguaCristales.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
          padding: EdgeInsets.only(top: 15, left: 10,bottom: 20),
          scrollDirection: Axis.horizontal,
          children: places.map((place) {
            return cardImage(imagePath: place);
          }).toList()),
    );
  }
}
