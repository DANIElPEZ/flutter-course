import 'package:flutter/material.dart';
import 'package:trips/widgets/gradient_back.dart';
import 'package:trips/widgets/button_green.dart';
import 'package:trips/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SingInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SingInScreen();
}

class _SingInScreen extends State<SingInScreen> {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return singInGoogleUi();
  }

  Widget singInGoogleUi() {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      GradientBack("", MediaQuery.of(context).size.height),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Welcome \n This is your Travel App',
            style: TextStyle(
                fontSize: 35,
                fontFamily: 'Lato',
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        ButtonGreen(
            width: 300,
            height: 50,
            text: 'Login with Gmail',
            onPressed: () {
              userBloc.signIn();
            })
      ])
    ]));
  }
}
