import 'package:flutter/material.dart';

class InfoCont extends StatelessWidget {

  final String image_path;
  final String value;
  InfoCont(this.image_path, this.value);

  //BUDE TREBA PREROBIŤ

  @override
  Widget build(BuildContext context) {
    return new Container( //alignment: Alignment.centerRight,
        margin: new EdgeInsets.all(12.0),
        width: (MediaQuery.of(context).size.width - 157.0)/2, // screen width - ( image width + paddings)
        height: 53.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          image: new DecorationImage(
            image: new ExactAssetImage(image_path),
            alignment: Alignment.bottomLeft,
          ),
        ),
        child: new Text( value,
          textAlign: TextAlign.right,
          style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        )
    );
  }
}
