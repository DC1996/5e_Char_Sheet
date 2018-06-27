import 'package:flutter/material.dart';
import 'Styling.dart' as style;

class HealthBar extends StatelessWidget {

  final charHP = 10;

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      margin: new EdgeInsets.fromLTRB(3.5, 8.6, 3.5, 3.5),
      width: MediaQuery.of(context).size.width * 0.69,
      height: MediaQuery.of(context).size.height * 0.055,
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Color(0xffba1212),
          width: 4.0,
        ),
        boxShadow: [style.blackShadow],
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(6.0),
        color: Color(0xFFececec),
      ),
      child: new Center(
        child: new Text(
          'HP : ${charHP.toString()}',
          style: new TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
