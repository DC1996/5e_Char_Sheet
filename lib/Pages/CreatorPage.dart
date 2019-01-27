import 'package:flutter/material.dart';

import 'package:char_sheet_5e/Widgets/Creator/RacePicker.dart';
import 'package:char_sheet_5e/Widgets/Creator/ClassPicker.dart';


class CreatorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFF1D1D1D),

      appBar: AppBar(
        backgroundColor: Color(0xFF030303),
        iconTheme: new IconThemeData(color: Color(0xFFececec)),
        title: Text("Character Creator",
          textAlign: TextAlign.left,
          maxLines: 2,
          style: new TextStyle(
            fontSize: 20.0,
            color: Color(0xFFececec),
          ),
        ),
      ),

      body: new SafeArea(child: new ListView(
        children: <Widget>[
          new RacePicker(),
          new ClassPicker(),
        ],
      )),
    );
  }

}


