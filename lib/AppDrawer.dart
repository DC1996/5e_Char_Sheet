import 'package:flutter/material.dart';
import 'package:char_sheet_5e/DrawerRow.dart';
import 'Logo.dart';

Drawer appDrawer = new Drawer(
  child: Container(
    color: Colors.black,
    child: new ListView(
      children: <Widget>[
        new Logo('/'),
        new DrawerRow('Character', '/CharacterPage','images/notes.png'),
        new DrawerRow('Inventory', '/EquipmentPage','images/bp.png'),
        new DrawerRow('Weapons', '/WeaponsPage','images/weapons.png'),
        new DrawerRow('Spells', '/SpellsPage','images/sb.png'),
      ],
    ),
  ),
);