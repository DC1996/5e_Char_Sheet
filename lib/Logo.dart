import 'package:flutter/material.dart';

//riadok v drawer-i
class Logo extends GestureDetector{

  //definuje a nastaví hodnotu v constructor-e
  final String pageName; //pageName sú definovane main.dart -> routes
  Logo(this.pageName);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.of(context).popAndPushNamed(pageName);
      },
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        child: new Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset('images/5e-menu-logo.png',
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            new Text('5e Adventure Helper',
              overflow: TextOverflow.fade,
              style: new TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            new Text('Ver 0.7.3',
              overflow: TextOverflow.fade,
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.white,
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
