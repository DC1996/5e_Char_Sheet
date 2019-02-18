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

  ///get the reference to the local file-list
  static Future<File> get localFileList async {
    final path = await localPath;
    return File(path + '/listOfCharactersLocally.json');
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
      String body = await file.readAsString();
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


  ///LOADING CHARACTER DATA AT THE BEGINNING
  ///
  /// the first time we start the app the local files are not yet created so we
  /// load from the assets and save the file-list to the local storage
  /// and we save the character data to the local storage as well
  ///
  /// then all the other times we simply load the lastUsed file (character data)
  /// and push it into the app...
  ///
  ///
  static Future<Character> loadNewCharacter() async {
      ListFiles files;
        //we try to get the lastUsed character data from the local files
        final File localFiles = await localFileList;
        print("Does the file exist? - ${localFiles.existsSync()}");
        // - should be false the first time

        if (localFiles.existsSync()) {
          //if the local files were created (a.k.a we loaded the app once)
          //we read from them...
          final data = await localFiles.readAsString();
          files = ListFiles.fromJson(json.decode(data));
          print("File list contains last used: ${files.lastUsed.toString()}");
          //get the last used file and return it's character data
          final lastUsed = await getLocalFile(files.lastUsed);
          final String charData = await lastUsed.readAsString();
          return Character.fromJson(json.decode(charData));
          }
        //if not we create it and then load from assets
        else {
          //we need to load our character data template first
          String charTemplate = await loadAsset('data/char.json');
          Character defaultChar = Character.fromJson(json.decode(charTemplate));
          //then we load our file-list template
          String fileListTemplate = await loadAsset('data/ListFiles.json');
          files = ListFiles.fromJson(json.decode(fileListTemplate));

          print("Adding ${defaultChar.charId} to local file-list's filenames...");
          files.filenames.add(defaultChar.charId); // should be default
          print("Adding ${defaultChar.charId} to local file-list's lastUsed...");
          files.lastUsed = defaultChar.charId;

          //no we load the local file-list file
          localFileList.then((file) {
            //once loaded we create it
            file.createSync();
            //and write our data to it
            print("Writing - ${files.filenames[0]} + ${files.lastUsed} to local...");
            file.writeAsString(json.encode(files.toJson()));
          });

          //we also need to save the character to the local storage
          final firstCharFile = await getLocalFile(defaultChar.charId); //fetch the file
          print("The first file exits? : ${firstCharFile.existsSync()}");
          firstCharFile.createSync();
          print("Now it should : ${firstCharFile.existsSync()}");
          print("Saving the default char data to local path: ${firstCharFile.path}");
          firstCharFile.writeAsString(json.encode(defaultChar.toJson()));

          //load the default char data to the App-Data-Manager
          return defaultChar;
        }
  }

  static Future<File> saveCharacter(ListFiles filesToSave, Character char, String name) async {
      saveToFileList(filesToSave, name);
      final file = await getLocalFile(name); //fetch the file
      print("EXISTS: ${file.existsSync()}");
      file.createSync();
      print("EXISTS: ${file.existsSync()}");
      print("Saving to: ${file.path}");
      return file.writeAsString(json.encode(char.toJson()));
  }

  static void saveToFileList(ListFiles fileList, String charId) async {
    print("Saving file-name data of $charId to local file list.");
    //check if it already contains that name
    if(!fileList.filenames.contains(charId)) fileList.filenames.add(charId);
    fileList.lastUsed = charId;
    final file = await localFileList;
    print("Writing ${fileList.lastUsed}'s data to local storage...");
    file.writeAsString(json.encode(fileList.toJson()));
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