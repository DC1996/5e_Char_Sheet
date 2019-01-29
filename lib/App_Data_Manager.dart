import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

import 'package:char_sheet_5e/JsonModels/Character_model.dart';
import 'StorageManagement.dart';

class AppDataManager extends StatefulWidget {
  AppDataManager(this.child);

  final Widget child;

  static AppDataManagerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_CharacterData)
        as _CharacterData).data;
  }

  @override
  AppDataManagerState createState() => AppDataManagerState();
}

class AppDataManagerState extends State<AppDataManager> {
  StorageManagement storage = new StorageManagement();
  Character character;

  loadCharacterData() async {
    return new Future.delayed(Duration(seconds: 1), () async {
      character = await storage.loadCharacter();
    });
  }



  @override
  Widget build(BuildContext context) {
    return _CharacterData(this, widget.child);
  }

  void updateImage() async {
    File newImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      character.charImagePath = newImage.path;
      storage.saveCharacter(this.character);
    });
  }

  void modifyScore(int num, bool addOrRemove) {
    setState(() { ///true - increment, false - decrement
      if(addOrRemove) character.charAbTable.abilities[num].score++;
      else character.charAbTable.abilities[num].score--;
      storage.saveCharacter(this.character);
    });
  }


  void updateSaveProf(bool save, int num) {
    setState(() {
      character.charAbTable.abilities[num].save = save;
      storage.saveCharacter(this.character);
    });
  }

  void saveName(String newName) async { //zmena a zápis charName do súboru
    setState(() { //save new name in object
      character.charName = newName;
      storage.saveCharacter(this.character);
    });
  }

  Future changeName(BuildContext context) async { //changes the character name
    showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          title: new Text('Character Name'),
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                hintText: character.charName,
              ),
              onSubmitted: saveName,
            ),
          ],
        )
    );
  }

}

class _CharacterData extends InheritedWidget {
  _CharacterData(
      this.data,
      Widget child,
   ) : super (child: child);

  final AppDataManagerState data;

  @override
  bool updateShouldNotify(_CharacterData old) {
    return true;
  }

}
