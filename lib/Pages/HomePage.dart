import 'package:flutter/material.dart'; //package pre widgety
import 'package:flutter/services.dart'; //package pre dalšie funkcie

import 'package:char_sheet_5e/AppDrawer.dart'; //zobrazenie riadka v drawer-i
import 'package:char_sheet_5e/Widgets/Home/AbilityTable.dart'; //zobrazenie abilít
import 'package:char_sheet_5e/JsonModels/Character_model.dart';

import 'package:char_sheet_5e/GlobalVariables.dart'; // ---- GLOBAL VARIABLES ----

import 'dart:async';

import 'package:char_sheet_5e/Widgets/Home/AvatarInfo.dart';
import 'package:char_sheet_5e/Widgets/Home/StatsInfo.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';


class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    //set device orientation explicitly
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new Scaffold(
        resizeToAvoidBottomPadding: false, //prevents the widgets from resizing after keyboard pops up
        backgroundColor: Color(0xFF1D1D1D),
        ///App Drawer -------------------------
        drawer: appDrawer,
        ///App Bar ----------------------------
        appBar: new AppBar(
          backgroundColor: Color(0xFF030303),
          iconTheme: new IconThemeData(color: Color(0xFFececec)),
          title: new GestureDetector(
            onLongPress: () => data.changeName(context),
            child: new Text(data.character.charName),
          ),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.folder, color: Color(0xFFececec)),
                onPressed: () => Navigator.of(context).pushNamed('/CreatorPage')),
            new IconButton(icon: new Icon(Icons.settings, color: Color(0xFFececec)),
                onPressed: null),
          ],
        ),
        ///App Body ---------------------------
        body: new SafeArea(
                  child: new Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new AvatarInfo(),
                      new StatsInfo(),
                      new CharacterAbilityTable(),
                    ],
                  ),
                )
    );
  }
}
