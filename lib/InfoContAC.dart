import 'package:flutter/material.dart';
import 'Styling.dart' as style;

import 'dart:async';
import 'dart:io';

import 'package:char_sheet_5e/GlobalVariables.dart';

class InfoContAC extends StatefulWidget {

  @override
  InfoContACState createState() => InfoContACState();
}

class InfoContACState extends State<InfoContAC> {

  final String imagePath = 'images/Armor.png';

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onLongPress: changeCharAC,
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
                      child: new Text(charAC.toString(),
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
  void setCharAC(String newCharAC) {
    setState(() {
      charAC = int.tryParse(newCharAC);
    });
  }

  Future<File> writeCharAC(String newCharAC) async {
    setCharAC(newCharAC);
    return storage.writeData('charAC', int.tryParse(newCharAC));
  }

  // ---- FUNCTIONALITY FUNCTIONS ----
  Future changeCharAC() async { //menime meno charaktera
    await showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          title: new Text('Character AC'),
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: charAC.toString(),
              ),
              onSubmitted: writeCharAC,
              onChanged: writeCharAC,
            ),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Done')),
          ],
        )
    );
  }

}
