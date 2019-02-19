import 'package:flutter/material.dart';

import 'package:char_sheet_5e/JsonModels/Character_model.dart';

import 'package:char_sheet_5e/GlobalVariables.dart';
import 'package:char_sheet_5e/Widgets/Character/charPageTextCont.dart';
import 'package:char_sheet_5e/Widgets/Home/AvatarInfo.dart';

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

    Widget _formattedText(String value, String data) {
      return new Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.05),
          child:Text( "$value: $data",
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.035),
      ));
    }

    Widget _formattedClassText(String value, String name, String level) {
      return new Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child:Text( "$value: $name $level",
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.035),
          ));
    }

    Widget _CharacterSummary() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.28,
        //margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3.5,),
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(15),),
              Text(data.character.charName, style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
              Text(data.character.charClass.className, style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0)),
              Text('Level ${data.character.charClass.classLevel.toString()}', style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0)),
              Text("${data.character.charRace}, ${data.character.charAlignment}", style: TextStyle(color: Colors.black, fontSize: 13.5, fontStyle: FontStyle.italic)),
            ]
        ),
      );
    }

    Widget _details() {
      return new Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _formattedClassText("Class", data.character.charClass.className, AppDataManager.of(context).character.charClass.classLevel.toString()),
            _formattedText("Race", data.character.charRace),
            _formattedText("Alignment", data.character.charAlignment)
          ],
        ),
      );
    }

    Widget _baseCharInfo(String name) {
      return new Container(
          height: MediaQuery.of(context).size.height * 0.465,
          width: MediaQuery.of(context).size.width,
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
                child: _CharacterSummary()),
            Positioned(child: CharacterAvatar(MediaQuery.of(context).size.width * 0.2, "charImage"),),
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
              _baseCharInfo(AppDataManager.of(context).character.charName),
            ],
          ),
      ),
    );
  }

}
