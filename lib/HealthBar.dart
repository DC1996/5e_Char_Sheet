import 'package:flutter/material.dart';
import 'Styling.dart' as style;

import 'dart:async';


// ---- GLOBAL VARIABLES
int charHP = 0;

class HealthBar extends StatefulWidget {
  @override
  HealthBarState createState() => HealthBarState();
}

class HealthBarState extends State<HealthBar> {

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: null,
      onLongPress: changeCharHP,
      child: new Container(
        alignment: Alignment.center,
        margin: new EdgeInsets.fromLTRB(3.5, 8.6, 3.5, 3.5),
        width: MediaQuery.of(context).size.width * 0.69,
        height: MediaQuery.of(context).size.height * 0.055,
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Color(0xffba1212),
            width: 4.0,
          ),
          boxShadow: [style.blackShadow],
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(6.0),
          color: Color(0xFFececec),
        ),
        child: new Center(
          child: new Text(
            'HP : ${charHP.toString()}',
            style: new TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // ---- STATE CHANGING FUNCTIONS ----
  void setCharHP(String newCharHP) {
    setState(() {
      charHP = int.tryParse(newCharHP);
    });
  }

  // ---- FUNCTIONALITY FUNCTIONS ----
  Future changeCharHP() async { //menime meno charaktera
    await showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          title: new Text('Character HP'),
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: charHP.toString(),
              ),
              onSubmitted: setCharHP,
              onChanged: setCharHP,
            ),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Done')),
          ],
        )
    );
  }
}
