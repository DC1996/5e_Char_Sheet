import 'package:flutter/material.dart';

class CharImage extends StatelessWidget {

  String value;
  CharImage(this.value);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(12.0),
      width: 85.0,
      height: 130.0,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        image: new DecorationImage(
          image: new ExactAssetImage(value),
        ),
      ),
    );
  }
}
