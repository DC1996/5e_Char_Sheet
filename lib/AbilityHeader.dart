import 'package:flutter/material.dart';
import 'Styling.dart' as style;

class AbilityHeader extends StatelessWidget {

  final TextStyle header = new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {

    final double abilityHeaderWidth = MediaQuery.of(context).size.width * 0.9;

    return new Container(
      width: abilityHeaderWidth,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Container(
            width: abilityHeaderWidth/2.3,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(left: 26.0),
                  child: new Text('Attribute', style: header,)
                ),
              ],
            ),
          ),
          new Column(
            children: <Widget>[
              new Text('Score', style: header,),
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
