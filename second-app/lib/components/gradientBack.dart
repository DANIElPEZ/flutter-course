import 'package:flutter/material.dart';

class gradientBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 240,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF4268D3),
              Color(0xFF584CD1)
            ],
                begin: FractionalOffset(0.2, 0),
                end: FractionalOffset(1, 0),
                stops:[0,0.6],
            tileMode: TileMode.clamp)
        ),
      child: Text('Popular',style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold
      )),
      alignment: Alignment(-0.9, -0.6),
    );
  }
}