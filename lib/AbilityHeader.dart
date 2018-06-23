import 'package:flutter/material.dart';

class AbilityHeader extends StatelessWidget {

  final TextStyle header = new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: new EdgeInsets.fromLTRB(
          4.6,
          12.0,
          4.6,
          0.0),
      decoration: new BoxDecoration(
          color:  Color(0xFFececec),
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
          new Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(left: 15.0),
                  child: new Text('Attribute', style: header,)
                )
              ],
            ),
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
