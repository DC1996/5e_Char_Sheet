import 'package:flutter/material.dart';
import 'StatsInfo.dart';
import 'package:char_sheet_5e/GlobalVariables.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AvatarInfo extends StatefulWidget {
  @override
  _AvatarInfoState createState() => _AvatarInfoState();
}

class _AvatarInfoState extends State<AvatarInfo> {

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.975,
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            border: new Border.all(
              //color: Colors.grey,
              width: 2.0,
            ),
            color: Colors.black,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: Stack(
          children: <Widget>[
            new Positioned(
              child: CharacterAvatarInfo(),
              top: MediaQuery.of(context).size.height * 0.013,
              left: MediaQuery.of(context).size.width * 0.2,
            ),
            new Positioned(
              child: new CharacterAvatar(),
              top: MediaQuery.of(context).size.height * 0.0145,
              left: MediaQuery.of(context).size.width * 0.032,
            ),
          ],
        )
    );
  }
}

class CharacterAvatar extends StatefulWidget {
  @override
  _CharacterAvatarState createState() => _CharacterAvatarState();
}

class _CharacterAvatarState extends State<CharacterAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3.5, spreadRadius: 2.5)],
      ),
      child: GestureDetector(
        onTap: updateImage,
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: MediaQuery.of(context).size.width * 0.13,
          backgroundImage: ExactAssetImage(character.charImagePath),
        ),
      )
    );
  }

  void updateImage() async {
    File newImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      character.charImagePath = newImage.path;
    });
    storage.saveCharacter();
  }

}

class CharacterAvatarInfo extends StatefulWidget {
  @override
  _CharacterAvatarInfoState createState() => _CharacterAvatarInfoState();
}

class _CharacterAvatarInfoState extends State<CharacterAvatarInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.715,
      height: MediaQuery.of(context).size.height * 0.16,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3.5,),
          //boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 1.5, blurRadius: 1.5)],
          color: Colors.white,
          shape: BoxShape.rectangle,

          borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(2.0)),
            Text(character.charClass.className, style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0)),
            Text('Level ${character.charClass.classLevel.toString()}', style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0)),
            Padding(padding: EdgeInsets.all(3.0),),
            Text("${character.charRace}, ${character.charAlignment}", style: TextStyle(color: Colors.black, fontSize: 13.5, fontStyle: FontStyle.italic)),
          ]
      ),
    );
  }
}

class XPIndicator extends StatefulWidget {
  @override
  _XPIndicatorState createState() => _XPIndicatorState();
}

class _XPIndicatorState extends State<XPIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      width: MediaQuery.of(context).size.width * 0.83,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0x0FF0940AA),
              width: 3.0
          ),
          boxShadow: [BoxShadow(
            color: Color(0x0FF0940AA),
            blurRadius: 1.5,
            spreadRadius: 1.0,)],
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(3.0)
      ),
      child: Text("XP: 12/50", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11.0),),
    );
  }
}

class XPBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      width: MediaQuery.of(context).size.width * 0.18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0x0FF0940AA),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(3.0)
      ),
    );
  }
}



