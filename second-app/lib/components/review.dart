import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  Review(
      {required this.pathImage,
      required this.name,
      required this.details,
      required this.starPoints,
      required this.comment});

  final String pathImage;
  final String name;
  final String details;
  final String comment;
  final double starPoints;

  @override
  Widget build(BuildContext context) {
    Widget starIcon(IconData icon) {
      return Container(
          margin: EdgeInsets.only(top: 3),
          child: Icon(icon, color: Color.fromARGB(255, 230, 230, 0), size: 13));
    }

    List<Widget> buildStars(double rating) {
      List<Widget> stars = [];

      int fullStars = rating.floor();
      bool halfStar = (rating - fullStars) >= 0.5;
      int emtyStars = 5 - fullStars - (halfStar ? 1 : 0);

      for (int i = 0; i < fullStars; i++) {
        stars.add(starIcon(Icons.star));
      }
      if (halfStar) {
        stars.add(starIcon(Icons.star_half));
      }
      for (int i = 0; i < emtyStars; i++) {
        stars.add(starIcon(Icons.star_outline));
      }

      return stars;
    }

    Widget textContent(text, double size, color, weight) {
      return Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(text,
              softWrap: true,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.left,
              style:
                  TextStyle(fontSize: size, color: color, fontWeight: weight)));
    }

    final photo = Container(
        margin: EdgeInsets.only(bottom: 14),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(pathImage))));

    final userDetail = Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      textContent(name, 16, Colors.black, FontWeight.w500),
      Row(children: [
        textContent(details, 14, Colors.black54, FontWeight.w300),
        SizedBox(width: 5),
        Row(children: buildStars(starPoints))
      ]),
      textContent(comment, 15, Colors.black, FontWeight.w800)
    ]));

    return Row(children: [photo, userDetail]);
  }
}
