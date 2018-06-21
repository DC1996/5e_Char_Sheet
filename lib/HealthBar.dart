import 'package:flutter/material.dart';

class HealthBar extends StatelessWidget {

  final charHP;
  HealthBar(this.charHP);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(12.0),
      width: MediaQuery.of(context).size.width - 133.0, // screen width - ( image width + paddings)
      height: 53.0,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(10.0),
        color: Colors.red,
      ),
      child: new Center(
        child: new Text(
          'HP: ${charHP.toString()}',
          style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
