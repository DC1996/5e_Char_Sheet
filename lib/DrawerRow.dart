import 'package:flutter/material.dart';

//riadok v drawer-i
class DrawerRow extends FlatButton {

  //definuje a nastaví hodnotu v constructor-e
  final String value; //názov
  final String pageName; //pageName sú definovane main.dart -> routes
  DrawerRow(this.value, this.pageName);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        padding: new EdgeInsets.all(2.0),
        onPressed: (){
          Navigator.of(context).pushNamed(pageName);
        },
        child: new Center(
          child: new Text(value), //viditelný názov
        )
    );
  }

}
