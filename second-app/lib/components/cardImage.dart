import 'package:flutter/material.dart';
import 'floatButton.dart';

class cardImage extends StatelessWidget{
  cardImage({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {

    final card=Container(
      width: 250,
      margin: EdgeInsets.only(top: 80,left: 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,
            offset: Offset(0, 7)
          )
        ]
      ),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: [
        card,
        likeFloatButton()
      ]
    );
  }
}