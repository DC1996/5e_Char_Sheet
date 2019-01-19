import 'package:flutter/material.dart';

class DrawerRow extends FlatButton {

  final String value;
  final String pageName;
  final String imagePath;

  DrawerRow(this.value, this.pageName, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(pageName);
      },
      child: new Container(
        margin: new EdgeInsets.fromLTRB(2.5, 3.0, 2.5, 3.0),
        padding: new EdgeInsets.all(5.0),
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
            ),
          ],
          border: new Border.all(
            color: Colors.black,
            width: 4.0,
          ),
          color: Color(0xFFececec),
        ),
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new Image.asset(
                imagePath,
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              width: MediaQuery.of(context).size.width * 0.32,
            ),
            new Container(
                child: new Center(
                    child: new Text(
              value,
              style: new TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ))),
          ],
        ),
      ),
    );
  }
}
