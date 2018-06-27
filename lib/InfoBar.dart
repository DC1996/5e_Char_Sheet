import 'package:flutter/material.dart';
import 'InfoBarContainer.dart';

class InfoBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Column(children: <Widget>[new InfoBarContainer('images/sb.png'),],),
          new Column(children: <Widget>[new InfoBarContainer('images/weapons.png'),],),
          new Column(children: <Widget>[new InfoBarContainer('images/inv.png'),],),
          new Column(children: <Widget>[new InfoBarContainer('images/notes.png'),],),
        ],
      )
    );
  }

}
