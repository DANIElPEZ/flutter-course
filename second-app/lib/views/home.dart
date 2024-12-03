import 'package:flutter/material.dart';
import 'package:review_app/components/description_place.dart';
import 'package:review_app/components/reviewList.dart';
import 'package:review_app/components/appBar.dart';
import 'package:review_app/components/buttonNavigate.dart';

class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
        children: [
          Center(
              child: Column(children: [
                DescriptionPlace(
                  title: 'Mount Everest',
                  starPoints: 3.0,
                  description_text:
                  'Mount Everest, known locally as Sagarmatha or Qomolangma,is Earth\'\s highest mountain above sea level, located in the Mahalangur Himal sub-range of the Himalayas. The China–Nepal border runs across its summit point. Its elevation (snow height) of 8,848.86 m (29,031 ft) was most recently established in 2020 by the Chinese and Nepali authorities.',
                ),
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 33),
                          navButton(),
                          SizedBox(height: 33),
                          Text('All reviews',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 100, 100, 100),
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 15),
                          reviewList()
                        ]))
              ]))
        ],
      ),
      headerAppBar()
    ]);
  }
}