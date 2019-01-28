import 'package:flutter/material.dart';

import 'package:char_sheet_5e/JsonModels/Character_model.dart';

import 'package:char_sheet_5e/GlobalVariables.dart';
import 'package:char_sheet_5e/Widgets/Character/charPageTextCont.dart';

import 'package:char_sheet_5e/AppDrawer.dart';
import 'package:char_sheet_5e/App_Data_Manager.dart';

class CharacterPage extends StatefulWidget {
  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);

    return new Scaffold(
      resizeToAvoidBottomPadding: true,
      drawer: appDrawer,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        iconTheme: new IconThemeData(color: Color(0xFFececec)),
        title: new Text(data.character.charName),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.folder, color: Color(0xFFececec)),
              onPressed: null),
          new IconButton(icon: new Icon(Icons.settings, color: Color(0xFFececec)),
              onPressed: null),
        ],
      ),

      //backgroundColor: Colors.white10,
      body: new SafeArea(
          child: ListView(
            padding: new EdgeInsets.only(top: 3.0),
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.fromLTRB(3.0, 0.0, 2.0, 0.5),
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.28,
                    decoration: new BoxDecoration(
                      border: new Border.all(
                      color: Colors.black,
                      width: 4.0,
                      ),
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(6.0),
                    image: new DecorationImage(
                      image: new ExactAssetImage('images/char_Image.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                  ),
                 new Column(
                    children: <Widget>[
                      new ClassTextCont(),
                      new TextCont('Race'),
                      new TextCont('Alignment'),
                      new TextCont('Background'),
                    ],
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              new Padding(padding: new EdgeInsets.only(top: 3.5)),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new GenTextCont('charFeatures'),
                  new GenTextCont('Armor Proficiences'),
                  new GenTextCont('Weapon Proficiences'),
                  new GenTextCont('Tool Proficiences'),
                  new GenTextCont('Languages Known'),
                  new GenTextCont('charPersonality'),
                ],
              ),
            ],
          ),
      ),
    );
  }

}
