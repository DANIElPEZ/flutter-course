import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  double width, height;
  final String text;
  final VoidCallback onPressed; //recive the function

  ButtonGreen(
      {required this.width,
      required this.height,
      required this.text,
      required this.onPressed});

  @override
  State<StatefulWidget> createState() => _ButtonGreen();
}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: this.widget.onPressed,
        child: Container(
            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
            width: this.widget.width,
            height: this.widget.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                    colors: [Color(0xFFa7ff84), Color(0xFF1cbb78)],
                    begin: FractionalOffset(0.2, 0.0),
                    end: FractionalOffset(1.0, 0.6),
                    stops: [0.0, 0.6],
                    tileMode: TileMode.clamp)),
            child: Center(
                child: Text(this.widget.text,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Lato",
                        color: Colors.white)))));
  }
}
