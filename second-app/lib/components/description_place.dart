import 'package:flutter/material.dart';

class DescriptionPlace extends StatelessWidget {
  DescriptionPlace(
      {required this.title,
      required this.starPoints,
      required this.description_text});

  final String title;
  final double starPoints;
  final String description_text;

  @override
  Widget build(BuildContext context) {
    Widget starIcon(IconData icon){
      return Container(
          margin: EdgeInsets.only(top: 3.0),
          child: Icon(icon,
              color: Color.fromARGB(255, 230, 230, 0)));
    }

    List<Widget> buildStars(double rating){
      List<Widget> stars=[];

      int fullStars=rating.floor();
      bool halfStar=(rating-fullStars)>=0.5;
      int emtyStars= 5-fullStars - (halfStar?1:0);

      for(int i=0;i<fullStars;i++) stars.add(starIcon(Icons.star));
      if(halfStar) stars.add(starIcon(Icons.star_half));
      for(int i=0;i<emtyStars;i++) stars.add(starIcon(Icons.star_outline));

      return stars;
    }

    final title_stars = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Container(
        child: Text(title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.left)
      ),
      Row(
        children: buildStars(starPoints)
      )
    ]);

    final descripition =Container(
            child: Text(description_text,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15.0)));

    final content_description = Container(
        margin: EdgeInsets.only(top: 290.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title_stars, SizedBox(height: 10.0), descripition]
      )
    );

    return content_description;
  }
}
