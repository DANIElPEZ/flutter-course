import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home.dart';
import 'searchPlaces.dart';
import 'profile.dart';

class reviewPlaces extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ReviewPlaces();
}

class ReviewPlaces extends State<reviewPlaces>{
  final List<Widget> views=[home(),search(),profile()];
  int indexTap=0;

  void onTap(int index){
    setState(() {
      this.indexTap=index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: views[indexTap],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.deepPurple
          ),
          child: BottomNavigationBar(
              currentIndex: indexTap,
              onTap: onTap,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.search),label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: "")
              ]),
        ));
  }
}