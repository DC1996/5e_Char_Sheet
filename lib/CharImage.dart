import 'package:flutter/material.dart';
import 'Styling.dart' as style;
import 'dart:ui' hide TextStyle;

class CharImage extends StatelessWidget {

  final String value;
  final String charClass = "Barbarian";
  final String classLevel = "2";
  CharImage(this.value);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(4.6, 8.6, 5.0, 4.6),
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.black,
          width: 4.0,
        ),
        boxShadow: [style.blackShadow],
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(6.0),
        image: new DecorationImage(
          image: new ExactAssetImage(value),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      alignment: Alignment.bottomCenter,
    child: new ClipRect(
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: new Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.25,
            height: 20.0,
            decoration: new BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.25)
            ),
            child: new Text(
              '$charClass $classLevel',
              textAlign: TextAlign.center,
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}