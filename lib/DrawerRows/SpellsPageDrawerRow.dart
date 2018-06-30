import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Pages/HomePage.dart';
import 'package:char_sheet_5e/Pages/SpellsPage.dart';

//riadok v drawer-i
class SpellsPageDrawerRow extends FlatButton {

  //definuje a nastaví hodnotu v constructor-e
  final String value;
  SpellsPageDrawerRow(this.value);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        padding: new EdgeInsets.all(2.0),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SpellsPage()),
          );
        },
        child: new Center(
          child: new Text(value), //hodnota
        )
    );
  }

}
