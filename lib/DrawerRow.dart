import 'package:flutter/material.dart';

//riadok v drawer-i
class DrawerRow extends FlatButton {

  //definuje a nastaví hodnotu v constructor-e
  final String value;
  DrawerRow(this.value);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        padding: new EdgeInsets.all(2.0),
        onPressed: null,
        child: new Center(
          child: new Text(value), //hodnota
            )
        );
  }
  
}
