import 'package:flutter/material.dart';

AppBar CustomAppBar = new AppBar(
  backgroundColor: Color(0xFF211e1e),
  iconTheme: new IconThemeData(color:  Color(0xFFececec)),
  title: new Text('Character_Name',
    textAlign: TextAlign.left,
    maxLines: 2,
    style: new TextStyle(
      fontSize: 20.0,
      color: Color(0xFFececec),
    ),
  ),
  actions: <Widget>[
    new IconButton(icon: new Icon(Icons.folder, color:  Color(0xFFececec)), onPressed: null),
    new IconButton(icon: new Icon(Icons.settings,color:  Color(0xFFececec)), onPressed: null),
  ],
);
