import 'package:flutter/material.dart';

//riadok v drawer-i
class DrawerTop extends GestureDetector{

  //definuje a nastaví hodnotu v constructor-e
  final String pageName; //pageName sú definovane main.dart -> routes
  DrawerTop(this.pageName);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(pageName);
      },
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        child: new Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset('images/5e-menu-logo.png',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            new Text('Character Overviewer',
              overflow: TextOverflow.fade,
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            new Text('Ver 0.1.0',
              overflow: TextOverflow.fade,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
