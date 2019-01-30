import 'package:flutter/material.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';

class AvatarInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: MediaQuery.of(context).size.height * 0.19,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(2.5),
        //margin: EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
            border: new Border.all(
              //color: Colors.grey,
              width: 2.0,
            ),
            color: Colors.black,
            //borderRadius: BorderRadius.only(topLeft: Radius.circular(6.5), topRight:Radius.circular(6.5))
        ),
        child: Stack(
          children: <Widget>[
            new Positioned(
              child: CharacterInfo(),
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

class CharacterAvatar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);

    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3.5, spreadRadius: 2.5)],
        ),
        child: GestureDetector(
          onTap: data.updateImage,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: MediaQuery.of(context).size.width * 0.13,
            backgroundImage: ExactAssetImage(data.character.charImagePath),
          ),
        )
    );
  }

}

class CharacterInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);

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
            Text(data.character.charClass.className, style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0)),
            Text('Level ${data.character.charClass.classLevel.toString()}', style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0)),
            Padding(padding: EdgeInsets.all(3.0),),
            Text("${data.character.charRace}, ${data.character.charAlignment}", style: TextStyle(color: Colors.black, fontSize: 13.5, fontStyle: FontStyle.italic)),
          ]
      ),
    );
  }
}
