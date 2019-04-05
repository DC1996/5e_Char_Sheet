import 'package:flutter/material.dart';

import 'package:char_sheet_5e/JsonModels/Character_model.dart';

import 'package:char_sheet_5e/Widgets/Character/charPageTextCont.dart';
import 'package:char_sheet_5e/Widgets/Home/AvatarInfo.dart';
import 'package:char_sheet_5e/App_Data_Manager.dart';

class CharacterPage extends StatefulWidget {
  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {


  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);

    Widget _baseCharInfo(String name) {
      return new Container(
          height: MediaQuery.of(context).size.height * 0.385,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: 2.5),
          padding: EdgeInsets.all(2.5),
          decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0))
          ),
          //margin: EdgeInsets.only(top: 5.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
            Positioned(
                top: MediaQuery.of(context).size.height * 0.17,
                child: CharacterInfo( MediaQuery.of(context).size.width * 0.95, MediaQuery.of(context).size.height * 0.2, false, true)
            ),
            Positioned(child: CharacterAvatar(MediaQuery.of(context).size.width * 0.2, "charImage", false),),
          ],),
      );
    }


    return new Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        iconTheme: new IconThemeData(color: Color(0xFFececec)),
        title: new Text("Character Information"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.settings, color: Colors.white),
              onPressed:() => Navigator.of(context).pushNamed("/ChangeValues")),
        ],
      ),

      backgroundColor: Color(0xFF1D1D1D),
      body: new SafeArea(
          child: ListView(
            children: <Widget>[
              _baseCharInfo(data.character.charName),
              TextCont("Personality", data.character.charPersonality, 1),
              TextCont("Background", data.character.charBackground, 2),
              TextCont("Languages Known", data.character.charLanguagesKnown, 3),
              TextCont("Features", data.character.charFeatures, 4),
              TextCont("Armor Proficiencies", data.character.charArmorProf, 5),
              TextCont("Weapon Proficiencies", data.character.charWeaponProf, 6),
              TextCont("Tool Proficiencies", data.character.charToolProf, 7),
              TextCont("Notes", data.character.charNotes, 8),
            ],
          ),
      ),
    );
  }

}
