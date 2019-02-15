import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

import 'package:char_sheet_5e/JsonModels/Alignments_model.dart';
import 'package:char_sheet_5e/JsonModels/AbilityScores_model.dart';
import 'package:char_sheet_5e/JsonModels/Character_model.dart';
import 'package:char_sheet_5e/JsonModels/Classes_model.dart';
import 'package:char_sheet_5e/JsonModels/Conditions_model.dart';
import 'package:char_sheet_5e/JsonModels/DamageType_model.dart';
import 'package:char_sheet_5e/JsonModels/Equipment_model.dart';
import 'package:char_sheet_5e/JsonModels/EquipmentCategory_model.dart';
import 'package:char_sheet_5e/JsonModels/Features_model.dart';
import 'package:char_sheet_5e/JsonModels/Languages_model.dart';
import 'package:char_sheet_5e/JsonModels/Levels_model.dart';
import 'package:char_sheet_5e/JsonModels/MagicSchools_model.dart';
import 'package:char_sheet_5e/JsonModels/Proficiencies_model.dart';
import 'package:char_sheet_5e/JsonModels/Races_model.dart';
import 'package:char_sheet_5e/JsonModels/Skills_model.dart';
import 'package:char_sheet_5e/JsonModels/Spells_model.dart';
import 'package:char_sheet_5e/JsonModels/Spellcastings_model.dart';
import 'package:char_sheet_5e/JsonModels/StartingEquipment_model.dart';
import 'package:char_sheet_5e/JsonModels/Subraces_model.dart';
import 'package:char_sheet_5e/JsonModels/Subclasses_model.dart';
import 'package:char_sheet_5e/JsonModels/Traits_model.dart';
import 'package:char_sheet_5e/JsonModels/WeaponProperties_model.dart';


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
  /// WILL REMAKE THE WHOLE THING INTO A DATABASE CLASS PROBABLY
  /// FOR EASIER MANAGEMENT AND ACCESS

  Character character;
  ListLanguages languageList;
  ListMagicSchools magicSchoolList;
  ListWeaponProperties weaponPropertiesList;
  ListLevels levelsList;
  ListEquipment equipmentList;
  ListEqCategories eqCategoriesList;
  ListConditions conditionList;
  ListDamageTypes damageTypesList;
  ProficiencyList proficiencyList;
  SpellcastingList spellcastingList;
  ListFeatures featuresList;
  StartingEqList startingEqList;
  SubraceList subraceList;
  TraitsList traitsList;
  ListRaces raceList;
  ListClasses classList;
  SubclassList subclassList;
  ListSkills skillList;
  ListAlignments alignmentList;
  ListAbilities abilityList;


  List<Spell> spellList = [];
  List<Spell> searchSpells = [];
  List<Spell> filterSpells = [];

  List<int> charLevels = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

  Future<Null> _getSpells() async {
    var database = await StorageManagement.loadSpells();
    spellList = database.spells;
    onSpellFilterChange();
  }


  onSpellSearchTextChanged(String text) async {
    searchSpells.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    //TIL dart cannot concatenate string with + operator
    StringBuffer upperCase = StringBuffer();
    for(int i = 0; i < text.length; i++) {
      if(i == 0) upperCase.write(text[i].toUpperCase());
      else upperCase.write(text[i]);
    }

    //search the filter or the whole pack
    if(filterSpells.length != 0) {
      filterSpells.forEach((spells) {
        if (spells.name.contains(text) ||
            spells.name.contains(upperCase.toString())) searchSpells.add(spells);
      });
    }
    else spellList.forEach((spells) {
      if (spells.name.contains(text) ||
          spells.name.contains(upperCase.toString())) searchSpells.add(spells);
    });
    //just reload state
    setState(() {});
  }

  onSpellFilterChange() async {

    filterSpells.clear();

    spellList.forEach((spell) {
      for(int i = 0; i < spell.classes.length; i++) {
          if(spell.classes[i].name == character.charClass.className) {
            filterSpells.add(spell);
            break;
          }
        }
      });

    spellList.forEach((spell) {
      if(spell.level > character.charClass.classLevel) {
        filterSpells.remove(spell);
      }
    });

      filterSpells.sort((a, b) => a.name.compareTo(b.name));
        setState(() {});
      }


  Future loadSpells() async {
    _getSpells();
  }

  //Loads the character data and skills
  Future loadApplicationDatabase() async {
    return new Future.delayed(Duration(microseconds: 0), () async {
      character = await StorageManagement.loadCharacter();
      skillList = await StorageManagement.loadSkills();
      abilityList = await StorageManagement.loadAbilityDesc();
      raceList = await StorageManagement.loadRaces();
      subraceList = await StorageManagement.loadSubraces();
      classList = await StorageManagement.loadClasses();
      subclassList = await StorageManagement.loadSubclasses();
      alignmentList = await StorageManagement.loadAlignments();
      spellcastingList = await StorageManagement.loadSpellcastings();
      startingEqList = await StorageManagement.loadStartingEq();
      proficiencyList = await StorageManagement.loadProficiencies();
      featuresList = await StorageManagement.loadFeatures();
      equipmentList = await StorageManagement.loadEquipment();
      eqCategoriesList = await StorageManagement.loadEqCategories();
      weaponPropertiesList = await StorageManagement.loadWeaponProperties();
      damageTypesList = await StorageManagement.loadDamageTypes();
      magicSchoolList = await StorageManagement.loadMagicSchools();
      traitsList = await StorageManagement.loadTraits();
      languageList = await StorageManagement.loadLanguages();
      levelsList = await StorageManagement.loadLevels();
      conditionList = await StorageManagement.loadConditions();
      loadSpells();
    });
  }

  ///-------------------------------------------------------------------------
  void changeImage() async {
    File newImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      character.charImagePath = newImage.path;
      StorageManagement.saveCharacter(this.character);
    });
  }

  void changeAbilityScore(int num, bool addOrRemove) {
    setState(() { ///true - increment, false - decrement
      if(addOrRemove) character.charAbTable.abilities[num].score++;
      else character.charAbTable.abilities[num].score--;
      StorageManagement.saveCharacter(this.character);
    });
  }


  void changeSaveProficiency(bool save, int num) {
    setState(() {
      character.charAbTable.abilities[num].save = save;
      StorageManagement.saveCharacter(this.character);
    });
  }

  void changeSkillProficiency(bool save, int num) {
    setState(() {
      character.charSkillsTable.skills[num].proficiency = save;
      StorageManagement.saveCharacter(this.character);
    });
  }

  void changeSkillDoubleProficiency(bool save, int num) {
    setState(() {
      character.charAbTable.abilities[num].save = save;
      StorageManagement.saveCharacter(this.character);
    });
  }

  void changeRace(String race) {
    setState(() {
      character.charRace = race;
      StorageManagement.saveCharacter(this.character);
    });
  }

  void changeLevel(int level) {
    setState(() {
      character.charClass.classLevel = level;
      onSpellFilterChange();
      StorageManagement.saveCharacter(this.character);
    });
  }

  void changeClass(String sClass) {
    setState(() {
      character.charClass.className = sClass;
      onSpellFilterChange();
      StorageManagement.saveCharacter(this.character);
    });
  }

  void changeAlignment(String al) {
    setState(() {
      character.charAlignment = al;
      StorageManagement.saveCharacter(this.character);
    });
  }

  void changeName(String newName) async {
    setState(() { //the empty space is so the tappable part remains wide enough to be tapped
      character.charName = newName == "" ? "        " : newName;
      StorageManagement.saveCharacter(this.character);
    });
  }

  void changeAC(String ac) async {
    setState(() {
      character.charAC = int.parse(ac);
      StorageManagement.saveCharacter(this.character);
    });
  }

  void changeProficiency(String prof) async {
    setState(() {
      character.charProf = int.parse(prof);
      StorageManagement.saveCharacter(this.character);
    });
  }

  void changeHealthPoints(String health) async {
    setState(() { //save new name in object
      character.charHealth.currentHP = int.parse(health);
      character.charHealth.maxHp = int.parse(health);
      StorageManagement.saveCharacter(this.character);
    });
  }

  ///---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return _CharacterData(this, widget.child);
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
