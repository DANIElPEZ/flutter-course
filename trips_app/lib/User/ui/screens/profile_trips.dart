import 'package:flutter/material.dart';
import 'package:trips/User/ui/screens/profile_header.dart';
import '../widgets/profile_places_list.dart';
import '../widgets/profile_background.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: [ProfileHeader(), ProfilePlacesList()],
        ),
      ],
    );
  }
}
