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
        Navigator.of(context).popAndPushNamed(pageName);
      },
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 4, horizontal: 8.5),
        padding: new EdgeInsets.all(5.0),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(6.5)),
          border: new Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          color: Colors.white,
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
