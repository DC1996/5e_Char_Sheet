import 'package:flutter/material.dart';
import 'DrawerRow.dart'; //zobrazenie riadka v drawer-i
import 'CharImage.dart'; //zobrazenie obrázka character-u
import 'HealthBar.dart'; //HP zobrazenie
import 'InfoCont.dart'; //Initiate + AC zobrazenie
import 'InfoBar.dart';
import 'AbilityHeader.dart';
import 'AbilityTable.dart';

//toto je vlastne čo vidíme v appke
//TOTO BUDEME MUSIEŤ PREROBIŤ NA STATEFUL aby sme mohli meniť veci podla inputu...
//ALE až NESKOR keď sa bude riesiť funkčnosť ;)
class HomePage extends StatelessWidget {

  final String charName = 'Barbaros The Mighty';
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
            new DrawerRow('Equipment'),
            new DrawerRow('Weapons'),
            new DrawerRow('Spells'),
          ],
        ),
      ),
      //App Bar ----------------------------
      //zatial naštýlovaný tuto lebo neviem ako spraviť zvlásť subor Xd
      appBar: new AppBar(
        backgroundColor: Color(0xFF211e1e),
        iconTheme: new IconThemeData(color: Color(0xFFececec)),
        title: new Text(charName,
            textAlign: TextAlign.left,
            style: new TextStyle(
              fontSize: 20.0,
              color: Color(0xFFececec),
            ),
          ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.folder, color: Color(0xFFc6c6c6)), onPressed: null),
          new IconButton(icon: new Icon(Icons.settings,color: Color(0xFFc6c6c6)), onPressed: null),
        ],
      ),
      //App Body ---------------------------
      body: new Column(
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new CharImage('images/test.png'),
                ],
              ),
              new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          new InfoCont('images/Armor.png', '12'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          new InfoBar(),
          new AbilityHeader(),
          new AbilityTable(),
        ],
      )
    );
  }

}
