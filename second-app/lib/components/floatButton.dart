import 'package:flutter/material.dart';

class likeFloatButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => likeButton();
}

class likeButton extends State<likeFloatButton> {
  bool pressed = false;

  void pressFav() {
    setState(() {
      if (pressed) {
        pressed = false;
      } else {
        pressed = true;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(pressed ? 'Added to favorites' : 'Deleted from favorites')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(pressed ? Icons.favorite : Icons.favorite_border_outlined,
            color: Colors.white),
        mini: true,
        tooltip: "Like place",
        onPressed: pressFav);
  }
}
