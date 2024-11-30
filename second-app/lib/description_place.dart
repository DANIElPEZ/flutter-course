import 'package:flutter/material.dart';

class DescriptionPlace extends StatelessWidget{

  String description_text='Mount Everest, known locally as Sagarmatha or Qomolangma,s Earths highest mountain above sea level, located in the Mahalangur Himal sub-range of the Himalayas. The China–Nepal border runs across its summit point.';

  @override
  Widget build(BuildContext context) {

    final star=Container(
      margin: EdgeInsets.only(
        top: 323,
        left: 3
      ),
      child: Icon(Icons.star,
      color: Color.fromARGB(255, 230, 230, 0),),
    );

    final title_stars=Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 320,
            left: 20,
            right: 20
          ),
          child: Text('Mount Everest',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900
          ),
          textAlign: TextAlign.left)
        ),
        Row(
          children: [
            star,
            star,
            star,
            star,
            star
          ],
        )
      ]
    );

    final descrpition=Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20
      ),
      child: Text(description_text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 13
      ))
    );

    final content_description=Container(
      child: Column(
        children: [
          title_stars,
          descrpition
        ],
      ),
    );

    return content_description;
  }
}