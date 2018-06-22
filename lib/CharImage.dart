import 'package:flutter/material.dart';

class CharImage extends StatelessWidget {

  final String value;
  CharImage(this.value);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(
          8.6,
          8.6,
          5.0,
          4.6),
      width: 106.6,
      height: 103.6,
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.black,
          width: 4.0,
        ),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        image: new DecorationImage(
          image: new ExactAssetImage(value),
          //fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: new Text(
        'Character Class and Level',
        textAlign: TextAlign.center,
        style: new TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
