import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AppDrawer.dart'; //zobrazenie riadka v drawer-i
import 'CharImage.dart'; //zobrazenie obrázka character-u
import 'HealthBar.dart'; //HP zobrazenie
import 'InfoCont.dart'; //Initiate + AC zobrazenie
import 'InfoBar.dart';
import 'AbilityHeader.dart';
import 'AbilityTable.dart';

import 'Styling.dart' as style;

//toto je vlastne čo vidíme v appke
//TOTO BUDEME MUSIEŤ PREROBIŤ NA STATEFUL aby sme mohli meniť veci podla inputu...
//ALE až NESKOR keď sa bude riesiť funkčnosť ;)
class HomePage extends StatelessWidget {

  final String charName = 'Mighty Barbaros';
  final int charHP = 10;


  @override
  Widget build(BuildContext context) {
    //blocks re-rendering when phone is tilted
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //disable status bar
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    //the main screen
    return new Scaffold(
      backgroundColor: Color(0xFFefefef),
      //App Drawer ------------------------
      drawer: AppDrawer,
      //App Bar ----------------------------
      //zatial naštýlovaný tuto lebo neviem ako spraviť zvlásť subor Xd
      appBar: new AppBar(
        backgroundColor: Color(0xFF211e1e),
        iconTheme: new IconThemeData(color:  Color(0xFFececec)),
        title: new Text(charName,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
