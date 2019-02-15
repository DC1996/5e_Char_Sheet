import 'dart:io';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:char_sheet_5e/GlobalVariables.dart';

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

import 'package:path_provider/path_provider.dart'; //getApplicationDocumentsDirectory()

class StorageManagement {

  //find app local path to storage
  //pre Android to je AppData/.. pre iOS je to NSDocumentDirectory/...
  static Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    print("$dir");
    return dir.path;
  }

  //we specify which file we want to get
  static Future<File> get localFile async {
    final path = await localPath; //path to the directory
    return File('$path/$fileName');
  }


  //find local path
  static Future<File> getLocalFile(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$filename');
  }

  //creates a new (json) file
  static void createFile(String file) async {
    jsonFile = new File('${await localPath}/$file');
    jsonFile.createSync();
  }


  //zápis do súboru
  static Future<File> writeData(String key, value) async {
    final file = await getLocalFile(fileName); //potrebujeme súbor
      if(file.existsSync()) {
        //AK SUBOR Už EXISTUJE
        Map body = await json.decode(file.readAsStringSync()); // načítame (zdekódujeme, rozbalíme) obsah jsonu do mapy
        body[key] = value; // pridáme novú key-value pár do mapy
        var data = json.encode(body); // zakódujeme, zabalíme (debugging...)
        print('$data'); // vypíšeme (debugging...)
        return file.writeAsString(json.encode(body));
      }
      else {
        createFile(fileName);
        Map body = {key: value};
        var data = json.encode(body); // zakódujeme, zabalíme (debugging...)
        print('$data'); // vypíšeme (debugging...)
        return file.writeAsString(json.encode(body));
      }
    }



  static Future<String> loadAsset(String file) async {
    return await rootBundle.loadString(file);
  }

  static Future<Character> loadNewCharacter() async {
    final file = await getLocalFile("FileList.json");
    File lastUsed;

    if(file.existsSync()) {
      final String data = await file.readAsString();
      final Map<String, dynamic> charFiles = json.decode(data);
      lastUsed = await getLocalFile(charFiles["lastUsed"]);
      final String charData = await lastUsed.readAsString();
      return Character.fromJson(json.decode(charData));
    }
    else {
      String body = await loadAsset('data/char.json');
      return Character.fromJson(json.decode(body));
    }

  }


  static Future<Character> loadCharacter() async {
      final file = await localFile;
      print("loading...");
      if(file.existsSync()) { // if it exist load last saved character
        String body = await file.readAsString();
        print(body);
        final jsondecode = json.decode(body);
        return Character.fromJson(jsondecode);
      }
      else {
        String body = await loadAsset('data/char.json');
        return Character.fromJson(json.decode(body));
      }
  }

  static Future<File> saveCharacter(Character char) async {
    final file = await localFile; //fetch the file
    return file.writeAsString(json.encode(char.toJson()));
  }

  static Future<ListSpells> loadSpells() async {
    String body = await loadAsset("data/Spells.json");
    return ListSpells.fromJson(json.decode(body));
  }

  static Future<ListRaces> loadRaces() async {
    String body = await loadAsset("data/Races.json");
    return ListRaces.fromJson(json.decode(body));
  }

  static Future<ListClasses> loadClasses() async {
    String body = await loadAsset("data/Classes.json");
    return ListClasses.fromJson(json.decode(body));
  }

  static Future<ListSkills> loadSkills() async {
    String body = await loadAsset("data/Skills.json");
    return ListSkills.fromJson(json.decode(body));
  }

  static Future<ListAlignments> loadAlignments() async {
    String body = await loadAsset("data/Alignments.json");
    return ListAlignments.fromJson(json.decode(body));
  }

  static Future<ListAbilities> loadAbilityDesc() async {
    String body = await loadAsset("data/Abilities.json");
    return ListAbilities.fromJson(json.decode(body));
  }

  static Future<SubclassList> loadSubclasses() async {
    String body = await loadAsset("data/Subclasses.json");
    return SubclassList.fromJson(json.decode(body));
  }

  static Future<ListConditions> loadConditions() async {
    String body = await loadAsset("data/Conditions.json");
    return ListConditions.fromJson(json.decode(body));
  }

  static Future<ListDamageTypes> loadDamageTypes() async {
    String body = await loadAsset("data/DamageTypes.json");
    return ListDamageTypes.fromJson(json.decode(body));
  }

  static Future<ListEquipment> loadEquipment() async {
    try{
    String body = await loadAsset("data/Equipment.json");
    return ListEquipment.fromJson(json.decode(body));
    }
    catch(e) {
      print(e.toString());
    }
  }

  static Future<ListEqCategories> loadEqCategories() async {
    String body = await loadAsset("data/EquipmentCategories.json");
    return ListEqCategories.fromJson(json.decode(body));
  }

  static Future<ListFeatures> loadFeatures() async {
    String body = await loadAsset("data/Features.json");
    return ListFeatures.fromJson(json.decode(body));
  }

  static Future<ListLanguages> loadLanguages() async {
    String body = await loadAsset("data/Languages.json");
    return ListLanguages.fromJson(json.decode(body));
  }

  static Future loadLevels() async {
    String body = await loadAsset("data/Levels.json");
    return ListLevels.fromJson(json.decode(body));
  }

  static Future<ListMagicSchools> loadMagicSchools() async {
    String body = await loadAsset("data/MagicSchools.json");
    return ListMagicSchools.fromJson(json.decode(body));
  }

  static Future<ProficiencyList> loadProficiencies() async {
    String body = await loadAsset("data/Proficiencies.json");
    return ProficiencyList.fromJson(json.decode(body));
  }

  static Future<SpellcastingList> loadSpellcastings() async {
    String body = await loadAsset("data/Spellcasting.json");
    return SpellcastingList.fromJson(json.decode(body));
  }

  static Future<SubraceList> loadSubraces() async {
    String body = await loadAsset("data/Subraces.json");
    return SubraceList.fromJson(json.decode(body));
  }

  static Future<StartingEqList> loadStartingEq() async {
    String body = await loadAsset("data/StartingEquipment.json");
    return StartingEqList.fromJson(json.decode(body));
  }

  static Future<TraitsList> loadTraits() async {
    String body = await loadAsset("data/Traits.json");
    return TraitsList.fromJson(json.decode(body));
  }

  static Future<ListWeaponProperties> loadWeaponProperties() async {
    String body = await loadAsset("data/WeaponProperties.json");
    return ListWeaponProperties.fromJson(json.decode(body));
  }



}