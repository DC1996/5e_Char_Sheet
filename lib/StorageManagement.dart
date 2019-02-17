import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io';

import 'package:char_sheet_5e/GlobalVariables.dart';
import 'package:char_sheet_5e/JsonModels/AbilityScores_model.dart';
import 'package:char_sheet_5e/JsonModels/Alignments_model.dart';
import 'package:char_sheet_5e/JsonModels/Character_model.dart';
import 'package:char_sheet_5e/JsonModels/Classes_model.dart';
import 'package:char_sheet_5e/JsonModels/Conditions_model.dart';
import 'package:char_sheet_5e/JsonModels/DamageType_model.dart';
import 'package:char_sheet_5e/JsonModels/EquipmentCategory_model.dart';
import 'package:char_sheet_5e/JsonModels/Equipment_model.dart';
import 'package:char_sheet_5e/JsonModels/Features_model.dart';
import 'package:char_sheet_5e/JsonModels/Languages_model.dart';
import 'package:char_sheet_5e/JsonModels/Levels_model.dart';
import 'package:char_sheet_5e/JsonModels/ListFiles_model.dart';
import 'package:char_sheet_5e/JsonModels/MagicSchools_model.dart';
import 'package:char_sheet_5e/JsonModels/Proficiencies_model.dart';
import 'package:char_sheet_5e/JsonModels/Races_model.dart';
import 'package:char_sheet_5e/JsonModels/Skills_model.dart';
import 'package:char_sheet_5e/JsonModels/Spellcastings_model.dart';
import 'package:char_sheet_5e/JsonModels/Spells_model.dart';
import 'package:char_sheet_5e/JsonModels/StartingEquipment_model.dart';
import 'package:char_sheet_5e/JsonModels/Subclasses_model.dart';
import 'package:char_sheet_5e/JsonModels/Subraces_model.dart';
import 'package:char_sheet_5e/JsonModels/Traits_model.dart';
import 'package:char_sheet_5e/JsonModels/WeaponProperties_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
//getApplicationDocumentsDirectory()


class StorageManagement {

  ///find app local path to storage
  ///for Android it's AppData/... for iOS it's NSDocumentDirectory/...
  static Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    print("$dir");
    return dir.path;
  }


  static Future<File> get localFile async {
    final path = await localPath; //path to the directory
    return File('$path/$fileName');
  }

  ///get the reference to the file
  static Future<File> get localFileList async {
    final path = await localPath;
<<<<<<< HEAD
<<<<<<< HEAD
    return File(path + '/characterFileList.json');
=======
    return File(path + '/fuckYOU.json');
>>>>>>> parent of bb34fdd... Reworked File System Loading
=======
    return File(path + '/whatHappenedLOL.json');
>>>>>>> parent of bd7e33d... Broken Update
  }

  static Future<ListFiles> loadFileList() async {
      try {
        String body = await loadAsset("data/ListFiles.json");
        final file = await localFileList;
        print("IT'S FUCKING LIVING ${file.existsSync()}");
        if (file.existsSync()) {
          final data = await file.readAsString();
          print("Reading from - ${file.path}");
          print(data);
          return ListFiles.fromJson(json.decode(data));
        }
        else
          return ListFiles.fromJson(json.decode(body));
      } catch (e) {print(e.toString());}
  }

  static Future<Character> loadSpecificChar(String name) async {
      final file = await getLocalFile(name);
      String body = file.readAsStringSync();
      print(body);
      return Character.fromJson(json.decode(body));
  }


  ///we specify which file we want to get
  static Future<File> getLocalFile(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$filename');
  }


  ///when loading from assets
  static Future<String> loadAsset(String file) async {
    return await rootBundle.loadString(file);
  }


  ///LOADING CHARACTER DATA AT THE START OF THE APP's LIFECYCLE
  static Future<Character> loadNewCharacter() async {
      ListFiles files;
        //we get the lastUsed file from the list
        final File localFiles = await localFileList;
        print("Does the file exist? - ${localFiles.existsSync()} - should be false the first time");

        if (localFiles.existsSync()) {
          final data = await localFiles.readAsString();
          files = ListFiles.fromJson(json.decode(data));
          print("File list contains: ${files.lastUsed.toString()}");
          if(files.lastUsed == ""){
            print("Loading from assets...");
            final String charData = await loadAsset("data/char.json");
            return Character.fromJson(json.decode(charData));
          }
          else {
            final lastUsed = await getLocalFile(files.lastUsed);
            final String charData = await lastUsed.readAsString();
            return Character.fromJson(json.decode(charData));
          }
        }
        //if not we create it and then load from assets
        else {
          String tmpData = await loadAsset('data/ListFiles.json');
          files = ListFiles.fromJson(json.decode(tmpData));
          print("Loading from assets...");

          localFileList.then((file) {
            file.createSync();
            file.writeAsString(json.encode(files.toJson()));
          });

          //load the data based from assets
          final String charData = await loadAsset("data/char.json");
          return Character.fromJson(json.decode(charData));
        }
  }

<<<<<<< HEAD
  static Future<File> saveCharacter(ListFiles filesToSave, Character char, String name) async {
<<<<<<< HEAD
=======
  static Future<File> saveNewCharacter(ListFiles filesToSave, Character char, String name) async {
>>>>>>> parent of bb34fdd... Reworked File System Loading
      saveToFileList(filesToSave, name);
=======
      //check if it already contains that name
      if(!filesToSave.filenames.contains(name))saveToFileList(filesToSave, name);
>>>>>>> parent of bd7e33d... Broken Update
      final file = await getLocalFile(name); //fetch the file
      print("EXISTS: ${file.existsSync()}");
      file.createSync();
      print("EXISTS: ${file.existsSync()}");
      print("Saving to: ${file.path}");
      return file.writeAsString(json.encode(char.toJson()));
  }

<<<<<<< HEAD
  static void saveToFileList(ListFiles fileList, String charId) async {
    print("Saving file-name data of $charId to local file list.");

    if(!fileList.filenames.contains(charId)) fileList.filenames.add(charId);
    fileList.lastUsed = charId;
=======
  static void saveToFileList(ListFiles filesToSave, String name) async {
    print("Saving file-name data of $name to file list.");
    if(!filesToSave.filenames.contains(name)) filesToSave.filenames.add(name);
    filesToSave.lastUsed = name;
    print(name);
    print(filesToSave.lastUsed);
>>>>>>> parent of bb34fdd... Reworked File System Loading
    final file = await localFileList;
    file.writeAsString(json.encode(filesToSave.toJson()));
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

  static Future<File> saveCharacter(Character char, String name) async {
    final file = await getLocalFile(name); //fetch the file
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
    String body = await loadAsset("data/Equipment.json");
    return ListEquipment.fromJson(json.decode(body));

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