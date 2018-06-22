import 'package:flutter/material.dart';

class AttributeHeader extends StatelessWidget {

  final TextStyle header = new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: new EdgeInsets.all(2.0),
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
              new Text('Attribute', style: header,),
            ],
          ),
          new Column(
            children: <Widget>[
              new Text('Points', style: header,),
            ],
          ),
          new Column(
            children: <Widget>[
              new Text('Mod', style: header,),
            ],
          ),
          new Column(
            children: <Widget>[
              new Text('Save', style: header,),
            ],
          ),
        ],
      ),
    );
  }
}
