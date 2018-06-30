import 'package:flutter/material.dart';
import 'Styling.dart' as style;

import 'dart:async';

// ---- GLOBAL VARIABLES ----
int value = 0;

class InfoContInit extends StatefulWidget {

  @override
  InfoContInitState createState() => InfoContInitState();
}

class InfoContInitState extends State<InfoContInit> {

  final String imagePath = 'images/Init.png';

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onLongPress: changeCharInit,
      child: new Container(
          margin: new EdgeInsets.only(left: 1.0),
          width: (MediaQuery.of(context).size.width * 0.7)/2,
          height: MediaQuery.of(context).size.height * 0.08,
          //STYLING ----------------------------------------
          decoration: new BoxDecoration(
            boxShadow: [style.blackShadow],
            border: new Border.all(
              color: Colors.black,
              width: 4.0,
            ),
            color: Color(0xFFececec),
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(8.0),
          ),
          // CONTENT ---------------------------------------
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Expanded(
                  child: new Center(
                      child: new Image.asset(imagePath)
                  )
              ),
              new Expanded(
                  child: new Center(
                      child: new Text(value.toString(),
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  )
              ),
            ],
          )
      ),
    );
  }

  // ---- STATE CHANGING FUNCTIONS ----
  void setCharInit(String newCharInit) {
    setState(() {
      value = int.tryParse(newCharInit);
    });
  }

  // ---- FUNCTIONALITY FUNCTIONS ----
  Future changeCharInit() async { //menime meno charaktera
    await showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          title: new Text('Character Initiative'),
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: value.toString(),
              ),
              onSubmitted: setCharInit,
              onChanged: setCharInit,
            ),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Done')),
          ],
        )
    );
  }
}
