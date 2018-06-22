import 'package:flutter/material.dart';

class HealthBar extends StatelessWidget {

  final charHP;
  HealthBar(this.charHP);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(
          5.0,
          8.6,
          8.6,
          3.5),
      width: MediaQuery.of(context).size.width - 133.8, // screen width - ( image width + paddings)
      height: 35.3,
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.black,
          width: 4.0,
        ),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(10.0),
        color: Color(0xffba1212),
      ),
      child: new Center(
        child: new Text(
          'HP: ${charHP.toString()}',
          style: new TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
