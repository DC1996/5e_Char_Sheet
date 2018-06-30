import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Pages/WeaponsPage.dart';

//riadok v drawer-i
class WeaponsPageDrawerRow extends FlatButton {

  //definuje a nastaví hodnotu v constructor-e
  final String value;
  WeaponsPageDrawerRow(this.value);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        padding: new EdgeInsets.all(2.0),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WeaponsPage()),
          );
        },
        child: new Center(
          child: new Text(value), //hodnota
        )
    );
  }

}
