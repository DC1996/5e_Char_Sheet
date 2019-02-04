import 'package:flutter/material.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';

class AvatarInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0))
        ),
        //margin: EdgeInsets.only(top: 5.0),
        alignment: Alignment.topCenter,
        child: Stack(
          children: <Widget>[
            new Positioned(
              child: CharacterInfo(),
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.2,
            ),
            new Positioned(
              child: new CharacterAvatar(),
              top: MediaQuery.of(context).size.height * 0.006,
              left: MediaQuery.of(context).size.width * 0.045,
            ),
          ],
        )
    );
  }
}

class CharacterAvatar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);

    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 2.0, blurRadius: 3.0)],
        ),
        child: GestureDetector(
          onTap: data.changeImage,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: MediaQuery.of(context).size.width * 0.13,
            backgroundImage: ExactAssetImage(data.character.charImagePath),
        )
    ));
  }

}

class CharacterInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);

    return Container(
      width: MediaQuery.of(context).size.width * 0.72,
      height: MediaQuery.of(context).size.height * 0.147,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3.5,),
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)
          )
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data.character.charClass.className, style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0)),
            Text('Level ${data.character.charClass.classLevel.toString()}', style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0)),
            Text("${data.character.charRace}, ${data.character.charAlignment}", style: TextStyle(color: Colors.black, fontSize: 13.5, fontStyle: FontStyle.italic)),
          ]
      ),
    );
  }
}
