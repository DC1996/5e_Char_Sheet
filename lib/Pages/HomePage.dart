import 'package:flutter/material.dart'; //package pre widgety
import 'package:flutter/services.dart'; //package pre dalšie funkcie

import 'package:char_sheet_5e/AppDrawer.dart'; //zobrazenie riadka v drawer-i
import 'package:char_sheet_5e/Widgets/Home/AbilityTable.dart'; //zobrazenie abilít
import 'package:char_sheet_5e/JsonModels/Character_model.dart';

import 'package:char_sheet_5e/GlobalVariables.dart'; // ---- GLOBAL VARIABLES ----

import 'dart:async';

import 'package:char_sheet_5e/Widgets/Home/AvatarInfo.dart';
import 'package:char_sheet_5e/Widgets/Home/StatsInfo.dart';

import 'package:async_loader/async_loader.dart';


class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    //set device orientation explicitly
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new Scaffold(
        resizeToAvoidBottomPadding: false, //prevents the widgets from resizing after keyboard pops up
        backgroundColor: Color(0xFF1D1D1D),
        ///App Drawer -------------------------
        drawer: appDrawer,
        ///App Bar ----------------------------
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            backgroundColor: Color(0xFF030303),
            iconTheme: new IconThemeData(color: Color(0xFFececec)),
            title: new GestureDetector(
              onLongPress: () => changeName(),
              child: FutureBuilder<Character>(
                future: storage.loadCharacter(),
                builder: (context, snapshot) {
                  //print(snapshot.data);
                  if(!snapshot.hasData) return Text("Loading...");
                  else return new Text(character.charName);
                },
              ),
            ),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.folder, color: Color(0xFFececec)),
                  onPressed: null),
              new IconButton(icon: new Icon(Icons.settings, color: Color(0xFFececec)),
                  onPressed: null),
            ],
          ),
        ),
        ///App Body ---------------------------
        body: FutureBuilder(
            future: storage.loadCharacter(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) return Text("");
              else {
                return new SafeArea(
                  child: new Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new AvatarInfo(),
                      new StatsInfo(),
                      new AbilityTable2(),
                    ],
                  ),
                );
              }
            })
    );
  }


  // ---- FUNCTIONALITY FUNCTIONS ----
  Future changeName() async { //changes the character name
    await showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          title: new Text('Character Name'),
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                hintText: character.charName,
              ),
              onSubmitted: saveName, //ZMENA A ZÁPIS
            ),
          ],
        )
    );
  }

  // ---- STORAGE FUNCTIONS ----
  void saveName(String newName) async { //zmena a zápis charName do súboru
    setState(() { //save new name in object
      character.charName = newName;
      Navigator.pop(context);
    });
    storage.saveCharacter();
    //print(character.charName);
  }
}
