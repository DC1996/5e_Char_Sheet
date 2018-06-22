import 'package:flutter/material.dart';

class AttributeRow extends StatelessWidget {

  final String attributeName;
  final String attributePoints;
  final String attributeMod;
  final String attributeSave;

  AttributeRow(
      this.attributeName,
      this.attributePoints,
      this.attributeMod,
      this.attributeSave
      );

  final TextStyle values = new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  final TextStyle skill = new TextStyle(
    fontSize: 25.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: new EdgeInsets.fromLTRB(
          2.0,
          8.0,
          2.0,
          8.0),
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          border: new Border.all(
            width: 2.5,
            color: Colors.black,
          )
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Text(attributeName, style: skill,),
            ],
          ),
          new Column(
            children: <Widget>[
              new Text(attributePoints, style: values,),
            ],
          ),
          new Column(
            children: <Widget>[
              new Text(attributeMod, style: values,),
            ],
          ),
          new Column(
            children: <Widget>[
              new Text(attributeSave, style: values,),
            ],
          ),
        ],
      ),
    );
  }
}
