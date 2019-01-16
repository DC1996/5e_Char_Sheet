import 'dart:io';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:char_sheet_5e/GlobalVariables.dart';
import 'Character_model.dart';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart'; //getApplicationDocumentsDirectory()

class StorageManagement {

  //find app local path to storage
  Future<String> get localPath async { //pre Android to je AppData/.. pre iOS je to NSDocumentDirectory/...
    final dir = await getApplicationDocumentsDirectory();
    //print("$dir");
    return dir.path;
  }

  //we specify which file we want to get
  Future<File> get localFile async {
    final path = await localPath; // path to the directory
    return File('$path/$fileName');
  }

  //creates a new (json) file
  void createFile() async {
    jsonFile = new File('${await localPath}/$fileName'); //await used when dealing with async functions
    jsonFile.createSync(); // boom, file created!!!
  }

  //reading data (from the json file)
  Future<String> readData(String key) async {
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
  Future<File> writeData(String key, value) async {
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


    // THE REAL DEAL MANEEEEEEEEEEEEEEEEEEEEEEEEEEE
  Future<String> loadAsset() async {
    return await rootBundle.loadString('data/char.json');
  }

  Future<Character> loadCharacter() async {
    final file = await localFile;
    String body = await file.readAsString();
    //if(body == null) body = await loadAsset();
    final jsondecode = json.decode(body);
    character = new Character.fromJson(jsondecode);
    //print(character.charName);
    return character;
  }

  Future<File> saveCharacter() async {
    final file = await localFile; //potrebujeme súbor
    //final data = await json.decode(file.readAsStringSync());
    //print('$data');
    return file.writeAsString(json.encode(character.toJson()));
  }
}