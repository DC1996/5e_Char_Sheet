import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Pages/HomePage.dart';

//riadok v drawer-i
class HomePageDrawerRow extends FlatButton {

  //definuje a nastaví hodnotu v constructor-e
  final String value;
  HomePageDrawerRow(this.value);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        padding: new EdgeInsets.all(2.0),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: new Center(
          child: new Text(value), //hodnota
        )
    );
  }

}
