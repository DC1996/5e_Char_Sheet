import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Pages/HomePage.dart';

class SpellsPage extends StatefulWidget {
  @override
  _SpellsPageState createState() => _SpellsPageState();
}

class _SpellsPageState extends State<SpellsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,

      appBar: new AppBar(
        backgroundColor: Colors.black,
        iconTheme: new IconThemeData(color: Color(0xFFececec)),
        title: new GestureDetector(
          child: new Text(charName,
            textAlign: TextAlign.left,
            maxLines: 2,
            style: new TextStyle(
              fontSize: 20.0,
              color: Color(0xFFececec),
            ),
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.folder, color: Color(0xFFececec)),
              onPressed: null),
          new IconButton(icon: new Icon(Icons.settings, color: Color(0xFFececec)),
              onPressed: null),
        ],
      ),

      body: new SafeArea(
          child: new Column(
            children: <Widget>[
              new Text('This is Spells page'),
            ],
          )
      ),

    );
  }

}