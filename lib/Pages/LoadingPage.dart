import 'package:flutter/material.dart';
import 'dart:math';

class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(), //?????
          new Image.asset('images/5e-menu-logo.png',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          new Text("5th Edition Adventure Helper", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.032),),
          Padding(padding: EdgeInsets.symmetric(vertical: 15.0), child: Text("Loading...", style: TextStyle(color: Colors.white,), textAlign: TextAlign.center,)),
          CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),)
    ])
    );
  }
}
