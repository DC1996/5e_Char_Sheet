import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Pages/EquipmentPage.dart';

//riadok v drawer-i
class EquipmentPageDrawerRow extends FlatButton {

  //definuje a nastaví hodnotu v constructor-e
  final String value;
  EquipmentPageDrawerRow(this.value);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        padding: new EdgeInsets.all(2.0),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EquipmentPage()),
          );
        },
        child: new Center(
          child: new Text(value), //hodnota
        )
    );
  }

}
