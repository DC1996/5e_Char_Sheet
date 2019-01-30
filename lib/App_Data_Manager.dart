import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

import 'package:char_sheet_5e/JsonModels/Character_model.dart';
import 'package:char_sheet_5e/JsonModels/Spells_model.dart';
import 'package:char_sheet_5e/JsonModels/Races_model.dart';
import 'package:char_sheet_5e/JsonModels/Classes_model.dart';
import 'package:char_sheet_5e/JsonModels/Skills_model.dart';
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
  ListSpells spellBook;
  ListRaces raceList;
  ListClasses classList;
  ListSkills skillList;

  Future loadCreator() async {
    return new Future.delayed(Duration(microseconds: 0), () async {
      raceList = await storage.loadRaces();
      classList = await storage.loadClasses();
    });
  }

  Future loadSpells() async {
    return new Future.delayed(Duration(microseconds: 0), () async {
      spellBook = await storage.loadSpells();
    });
  }

  Future loadCharacterData() async {
    return new Future.delayed(Duration(microseconds: 0), () async {
      character = await storage.loadCharacter();
      skillList = await storage.loadSkills();
      print(character.charSkillsTable.skills[0].name);
    });
  }

  ///-----------------------------------------------in

  List<DropdownMenuItem<String>> dropDownMenuItems;
  String currentRace;

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

  void prof(bool save, int num) {
    setState(() {
      character.charSkillsTable.skills[num].proficiency = save;
      storage.saveCharacter(this.character);
    });
  }

  void doubleProf(bool save, int num) {
    setState(() {
      character.charAbTable.abilities[num].save = save;
      storage.saveCharacter(this.character);
    });
  }

  void upDateCharRace(String race) {
    setState(() {
      character.charRace = race;
      storage.saveCharacter(this.character);
    });
  }

  void upDateCharClass(String sClass) {
    setState(() {
      character.charClass.className = sClass;
      storage.saveCharacter(this.character);
    });
  }

  void saveName(String newName) async { //zmena a zápis charName do súboru
    setState(() { //save new name in object
      character.charName = newName == "" ? "        " : newName;
      storage.saveCharacter(this.character);
    });
  }

  void saveAC(String ac) async { //zmena a zápis charName do súboru
    setState(() { //save new name in object
      character.charAC = int.parse(ac);
      storage.saveCharacter(this.character);
    });
  }

  void saveProf(String prof) async { //zmena a zápis charName do súboru
    setState(() { //save new name in object
      character.charProf = int.parse(prof);
      storage.saveCharacter(this.character);
    });
  }

  void saveHealth(String health) async { //zmena a zápis charName do súboru
    setState(() { //save new name in object
      character.charHealth.currentHP = int.parse(health);
      character.charHealth.maxHp = int.parse(health);
      storage.saveCharacter(this.character);
    });
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
