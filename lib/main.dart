import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:char_sheet_5e/Pages/HomePage.dart'; //include HomePage class

import 'package:char_sheet_5e/Pages/EquipmentPage.dart';
import 'package:char_sheet_5e/Pages/WeaponsPage.dart';
import 'package:char_sheet_5e/Pages/SpellsPage.dart';

void main() {
  //debugPaintSizeEnabled = true; //shows widget boundaries
  runApp(
    new MaterialApp(
      title: 'D&D CharSheet', //toto vidíš keď switchuješ medzi appkami
      home: new HomePage(), //domáca stránka applikácie
        // TUTO SI DEFINUJEME NAMED ROUTES
      routes: <String, WidgetBuilder> {
        //home page je defaultne definovany "/": (BuildContext context) => HomePage(),
       "/EquipmentPage": (BuildContext context) => new EquipmentPage(),
       "/WeaponsPage": (BuildContext context) => new WeaponsPage(),
       "/SpellsPage": (BuildContext context) => new SpellsPage(),
      }
    )
  );
}