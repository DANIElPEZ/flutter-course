import 'package:flutter/material.dart';

class navButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: 50,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
                    begin: FractionalOffset(0.2, 0),
                    end: FractionalOffset(1, 0.6),
                    stops: [0, 0.6],
                    tileMode: TileMode.clamp)),
            child: Center(
                child: Text('Navigate',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18)))),
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Navigating.')));
        });
  }
}
