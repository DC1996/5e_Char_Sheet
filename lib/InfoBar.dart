import 'package:flutter/material.dart';
import 'InfoCont2.dart';

class InfoBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new InfoCont2('images/sb.png'),
            ],
          ),
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new InfoCont2('images/weapons.png'),
            ],
          ),
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new InfoCont2('images/inv.png'),
            ],
          ),
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new InfoCont2('images/notes.png'),
            ],
          ),
        ],
      )
    );
  }
}
