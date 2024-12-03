import 'package:flutter/material.dart';
import 'review.dart';

class reviewList extends StatelessWidget {
  final List<Map<String, dynamic>> reviews = [
    {
      "pathImage": "asset/image/personOne.jpg",
      "name": "Juan",
      "details": "2 reviews 4 photos",
      "starPoints": 4.5,
      "comment": "The coldest place, very cold!",
    },
    {
      "pathImage": "asset/image/personTow.jpg",
      "name": "Maria",
      "details": "1 review 2 photos",
      "starPoints": 3.0,
      "comment": "Low oxygen, but amazing views.",
    },
    {
      "pathImage": "asset/image/personThree.jpg",
      "name": "German",
      "details": "2 reviews 1 photo",
      "starPoints": 3.5,
      "comment": "Dangerous challenge, be careful!",
    },
    {
      "pathImage": "asset/image/personFour.jpg",
      "name": "Karol",
      "details": "3 reviews 3 photos",
      "starPoints": 5.0,
      "comment": "I would try to visit again!",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: reviews.map((review) {
      return Review(
          pathImage: review["pathImage"],
          name: review["name"],
          details: review["details"],
          starPoints: review["starPoints"],
          comment: review["comment"]);
    }).toList());
  }
}
