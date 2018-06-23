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
              new InfoCont2('images/char_Image.png', '10'),
            ],
          ),
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new InfoCont2('images/char_Image.png', '10'),
            ],
          ),
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new InfoCont2('images/char_Image.png', '10'),
            ],
          ),
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new InfoCont2('images/char_Image.png', '10'),
            ],
          ),
        ],
      )
    );
  }
}
