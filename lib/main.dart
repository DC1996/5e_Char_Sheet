import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'HomePage.dart'; //include HomePage class

void main() {
  //shows widget boundaries
  debugPaintSizeEnabled = true;
  runApp(
    new MaterialApp(
      title: 'D&D CharSheet', //you see this when you switch apps
      home: new HomePage(), //home page of the app
    )
  );
}