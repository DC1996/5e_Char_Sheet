import 'package:flutter/material.dart';
import 'CharImage.dart'; //zobrazenie obrázka character-u
import 'HealthBar.dart'; //HP zobrazenie
import 'InfoCont.dart'; //Initiate + AC zobrazenie
import 'DrawerRow.dart'; //zobrazenie riadka v drawer-i

//toto je vlastne čo vidíme v appke
class HomePage extends StatelessWidget {

  final String charName = 'Character Name';
  final int charHP = 10;

  @override
  Widget build(BuildContext context) {
    //pozadie našej applikácie
    return new Scaffold(
      backgroundColor: Color(0xFFc6c6c6),
      //App Drawer ------------------------
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //toto bude potrebovať remake lebo sa to divne správa ak dáš padding
            //asi
            new DrawerRow('Character'),
            new DrawerRow('Inventory'),
            new DrawerRow('Weapons'),
            new DrawerRow('Spells'),
          ],
        ),
      ),
      //App Bar ----------------------------
      //zatial naštýlovaný tuto lebo neviem ako spraviť zvlásť subor Xd
      appBar: new AppBar(
        backgroundColor: Color(0xFF383232),
        iconTheme: new IconThemeData(color: Color(0xFFc6c6c6)),
        title: new FlatButton(
          onPressed: null,
          child: new Text(charName,
            style: new TextStyle(
              fontSize: 20.0,
              color: Color(0xFFc6c6c6),
            ),
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.folder, color: Color(0xFFc6c6c6)), onPressed: null),
          new IconButton(icon: new Icon(Icons.settings,color: Color(0xFFc6c6c6)), onPressed: null),
        ],
      ),
      //App Body ---------------------------
      body: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new CharImage('images/char_Image.png'),
              ],
            ),
            new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new HealthBar(charHP),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new InfoCont('images/Init.png', '3'),
                      ],
                    ),
                    new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                      new InfoCont('images/shield.png', '12'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}
