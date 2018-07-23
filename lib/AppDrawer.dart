import 'package:flutter/material.dart';
import 'package:char_sheet_5e/DrawerRow.dart';

Drawer appDrawer = new Drawer(
  child: new ListView(
    children: <Widget>[
      new DrawerRow('Character', '/'),
      new DrawerRow('Equipment', '/EquipmentPage'),
      new DrawerRow('Weapons', '/WeaponsPage'),
      new DrawerRow('Spells', '/SpellsPage'),
    ],
  ),
);