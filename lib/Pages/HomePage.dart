import 'package:flutter/material.dart'; //package pre widgety
import 'package:flutter/services.dart'; //package pre dalšie funkcie

import 'package:char_sheet_5e/AppDrawer.dart'; //zobrazenie riadka v drawer-i
import 'package:char_sheet_5e/BaseCharStats.dart'; //horná časť home page-u
import 'package:char_sheet_5e/InfoBar.dart'; // tie 4 kolonky nad Ability taublkou
import 'package:char_sheet_5e/AbilityHeader.dart'; //hlavička pre ability table
import 'package:char_sheet_5e/AbilityTable.dart'; //zobrazenie abilít

import 'dart:async';

//toto je vlastne čo vidíme v appke
//TOTO BUDEME MUSIEŤ PREROBIŤ NA STATEFUL aby sme mohli meniť veci podla inputu...
//ALE až NESKOR keď sa bude riesiť funkčnosť ;)

// ---- GLOBAL VARIABLES ----
String charName = "Character_Name";
String charImage;
String charClass;
int classLevel = 0;

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  final int charHP = 10;

  @override
  Widget build(BuildContext context) {
    //blokuje otáčanie obrazovky
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //hlavná obrazovka
    return new Scaffold(
      resizeToAvoidBottomPadding: false, //toto zaistí, že keď pop-up-ne klavesnica tak sa nám ability table nezmenší ;)
      backgroundColor: Color(0xFFefefef),
      //App Drawer -------------------------
      drawer: appDrawer,
      //App Bar ----------------------------
      appBar: new AppBar(
        backgroundColor: Colors.black,
        iconTheme: new IconThemeData(color: Color(0xFFececec)),
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
          new IconButton(icon: new Icon(Icons.folder, color: Color(0xFFececec)),
              onPressed: null),
          new IconButton(icon: new Icon(Icons.settings, color: Color(0xFFececec)),
              onPressed: null),
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

  // ---- STATE CHANGING FUNCTIONS ----
  void setName(String newName) {
    setState(() {
      charName = newName;
    });
    Navigator.pop(context);
  }

  // ---- FUNCTIONALITY FUNCTIONS ----
  Future changeName() async { //menime meno charaktera
    await showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
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
}
