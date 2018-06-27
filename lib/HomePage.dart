import 'package:flutter/material.dart'; //package pre widgety
import 'package:flutter/services.dart'; //package pre dalšie funkcie
import 'AppDrawer.dart'; //zobrazenie riadka v drawer-i
import 'BaseCharStats.dart'; //horná časť home page-u
import 'InfoBar.dart'; // tie 4 kolonky nad Ability taublkou
import 'AbilityHeader.dart'; //hlavička pre ability table
import 'AbilityTable.dart'; //zobrazenie abilít

import 'dart:async';

//toto je vlastne čo vidíme v appke
//TOTO BUDEME MUSIEŤ PREROBIŤ NA STATEFUL aby sme mohli meniť veci podla inputu...
//ALE až NESKOR keď sa bude riesiť funkčnosť ;)

class  HomePage extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<HomePage> {

  String charName = "XXXX";

  void setName(String newName) {
    setState(() {
      charName = newName;
    });
    Navigator.pop(context);
  }

  //menime meno charaktera
  Future changeName() async {
    await showDialog(
        context: context,
      child: new SimpleDialog(
        title: new Text('Character Name'),
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(
              hintText: charName,
            ),
            onSubmitted: setName,
          ),
        ],
      )
    );
  }

  final int charHP = 10;

  @override
  Widget build(BuildContext context) {
    //blokuje otáčanie obrazovky
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //hlavná obrazovka
    return new Scaffold(
      backgroundColor: Color(0xFFefefef),
      //App Drawer -------------------------
      drawer: AppDrawer,
      //App Bar ----------------------------
      appBar: new AppBar(
        backgroundColor: Color(0xFF211e1e),
        iconTheme: new IconThemeData(color:  Color(0xFFececec)),
        title: new GestureDetector(
          onLongPress: () => changeName(),
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
          new IconButton(icon: new Icon(Icons.folder, color:  Color(0xFFececec)), onPressed: null),
          new IconButton(icon: new Icon(Icons.settings, color:  Color(0xFFececec)), onPressed: null),
        ],
      ),
      //App Body ---------------------------
      body: new SafeArea(   //
          child: new Column(
            children: <Widget>[
              new BaseCharStats(), //obrazok, HP, Initiative, armor Class
              new InfoBar(), //4 kolonky pred tabulkou
              new AbilityHeader(),
              new AbilityTable(),
            ],
          )
      ),
    );
  }

}
