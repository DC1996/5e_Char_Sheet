import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'GlobalVariables.dart';

import 'package:char_sheet_5e/Pages/HomePage.dart'; //include HomePage class
import 'package:char_sheet_5e/Pages/CombatPage.dart';
import 'package:char_sheet_5e/Pages/CharacterPage.dart';

void main() {
  //debugPaintSizeEnabled = true; //shows widget boundaries
  //storage.loadCharacter();
  storage.loadSpells();
  runApp(
    new MaterialApp(
      title: 'D&D CharSheet', //title when we switch apps in OS
      home: new HomePage(
      ), //domáca stránka applikácie
      routes: <String, WidgetBuilder> {
        //home page je defaultne definovany "/": (BuildContext context) => HomePage(),
       "/CharacterPage": (BuildContext context) => new CharacterPage(),
       "/EquipmentPage": (BuildContext context) => new CharacterPage(),
       "/WeaponsPage": (BuildContext context) => new WeaponsPage(),
       "/SpellsPage": (BuildContext context) => new WeaponsPage(),
      }
    )
  );
}