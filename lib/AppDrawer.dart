import 'package:flutter/material.dart';
import 'DrawerRow.dart';
import 'Styling.dart' as style;

Drawer AppDrawer = new Drawer(
  child: new ListView(
    children: <Widget>[
      new DrawerRow('Character'),
      new DrawerRow('Equipment'),
      new DrawerRow('Weapons'),
      new DrawerRow('Spells'),
    ],
  ),
);