import 'dart:io';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:char_sheet_5e/GlobalVariables.dart';
import 'package:char_sheet_5e/JsonModels/Character_model.dart';
import 'package:char_sheet_5e/JsonModels/Spells_model.dart';
import 'package:char_sheet_5e/JsonModels/Races_model.dart';
import 'package:char_sheet_5e/JsonModels/Classes_model.dart';
import 'package:char_sheet_5e/JsonModels/Skills_model.dart';
import 'package:char_sheet_5e/JsonModels/Alignments_model.dart';
import 'package:char_sheet_5e/JsonModels/AbilityScores_model.dart';
import 'package:char_sheet_5e/JsonModels/Subclasses_model.dart';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart'; //getApplicationDocumentsDirectory()

class StorageManagement {

  //find app local path to storage
  static Future<String> get localPath async { //pre Android to je AppData/.. pre iOS je to NSDocumentDirectory/...
    final dir = await getApplicationDocumentsDirectory();
    //print("$dir");
    return dir.path;
  }

  //we specify which file we want to get
  static Future<File> get localFile async {
    final path = await localPath; // path to the directory
    return File('$path/$fileName');
  }

  //find local path
  static Future<File> getLocalFile(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$filename');
  }

  //create a new file
  static Future<File> createNewFile(String path) async {
    return File(path).create();
  }

   

  //creates a new (json) file
  static void createFile() async {
    jsonFile = new File('${await localPath}/$fileName'); //await used when dealing with async functions
    jsonFile.createSync(); // boom, file created!!!
  }

  //reading data (from the json file)
  static Future<String> readData(String key) async {
    try {
      final file = await localFile; // fetch the file
      if(file.existsSync()) {
        Map body = await json.decode(file.readAsStringSync()); //pipe the content into a map
        print(' HEJ $body');
        return body[key].toString();
      }
      else {
        return null; //if the file does not exist
      }
    } catch (e) {
      return e.toString();
    }
  }


  //zápis do súboru
  static Future<File> writeData(String key, value) async {
    final file = await localFile; //potrebujeme súbor
      if(file.existsSync()) {
        //AK SUBOR Už EXISTUJE
        Map body = await json.decode(file.readAsStringSync()); // načítame (zdekódujeme, rozbalíme) obsah jsonu do mapy
        body[key] = value; // pridáme novú key-value pár do mapy
        var data = json.encode(body); // zakódujeme, zabalíme (debugging...)
        print('$data'); // vypíšeme (debugging...)
        return file.writeAsString(json.encode(body));
      }
      else {
        //AK NIE tak ho vytvorím a zapíšem mapu do json
        createFile();
        Map body = {key: value};
        var data = json.encode(body); // zakódujeme, zabalíme (debugging...)
        print('$data'); // vypíšeme (debugging...)
        return file.writeAsString(json.encode(body));
      }
    }



  static Future<String> loadAsset(String file) async {
    return await rootBundle.loadString(file);
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
}