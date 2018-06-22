import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'HomePage.dart'; //include HomePage class

void main() {
  //debugPaintSizeEnabled = true; //shows widget boundaries
  runApp(
    new MaterialApp(
      title: 'D&D CharSheet', //toto vidíš keď switchuješ medzi appkami
      home: new HomePage(), //domáca stránka applikácie
    )
  );
}