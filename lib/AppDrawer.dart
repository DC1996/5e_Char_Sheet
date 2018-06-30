import 'package:flutter/material.dart';
import 'package:char_sheet_5e/DrawerRows/DrawerRow.dart';
import 'package:char_sheet_5e/DrawerRows/HomePageDrawerRow.dart';
import 'package:char_sheet_5e/DrawerRows/EquipmentPageDrawerRow.dart';
import 'DrawerRows/WeaponsPageDrawerRow.dart';
import 'DrawerRows/SpellsPageDrawerRow.dart';
import 'Styling.dart' as style;

Drawer AppDrawer = new Drawer(
  child: new ListView(
    children: <Widget>[
      new HomePageDrawerRow('Character'),
      new EquipmentPageDrawerRow('Equipment'),
      new WeaponsPageDrawerRow('Weapons'),
      new SpellsPageDrawerRow('Spells'),
    ],
  ),
);