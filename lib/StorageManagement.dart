import 'dart:io';
import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'Character_model.dart';

import 'package:path_provider/path_provider.dart'; //potrebujeme na getApplicationDocumentsDirectory()

import 'package:char_sheet_5e/GlobalVariables.dart';

///*********** BANNER MESSAGE FROM THE ARTIST ******************
///
/// SKÚSIl SOM TO V KOMENTOCH VYSVETlIŤ
/// PROSÍM PREČÍTAŤ
///
/// ps. ak niečo ešte chceš vedieť napíš mi P.M.
///
/// ***************************************************************

class StorageManagement {

  //zistujeme kde sa nachádza úložisko kde môže naša appka vytvárať súbory
  Future<String> get localPath async { //pre Andriod to je AppData/.. pre iOS je to NSDocumentDirectory/...
    final dir = await getApplicationDocumentsDirectory(); //nájde úložisko aplikácie na mobile kde môžeme vytvárať nové súbory,
    //print("$dir");
    return dir.path; //vracia 'cestu'
  }

  //s touto funkciou vraciame súbor ktorý potrebuejme
  Future<File> get localFile async {
    final path = await localPath; //najprv potrebujeme cestu (kde je súbor?)
    return File('$path/$fileName');
  }

  //vytvorím json file
  void createFile() async {
    jsonFile = new File('${await localPath}/$fileName'); //await treba, lebo to je async a treba počkať kým to vráti path
    jsonFile.createSync(); // boom, file created!!!
  }

  //čítanie zo súboru
  Future<String> readData(String key) async {
    try {
      final file = await localFile; // potrebujeme súbor
      //ak súbor existuje ->
      if(file.existsSync()) {
        Map body = await json.decode(file.readAsStringSync()); // načítame jeho obsah do mapy
        print(' HEJ $body'); // vypíšem aby sme videli (v console (4: RUN))
        return body[key].toString(); //vraciame obsah
      }
      else {
        return null; //kým súbor neexituje nemôžeme z neho čítať,
        // najrpv musíme niečo zapísať aby sa vytvoril a potom už môžeme
      }
    } catch (e) {
      return e.toString(); //toto je pre errory, ak náhodou sa niečo stane, aby nám kód ne-crash-ol
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
        return file.writeAsString(json.encode(body)); //zapíšeme (zakódujeme, zabalíme) mapu do json súboru
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

  Future<String> loadAsset() async {
    return await rootBundle.loadString('data/char.json');
  }

  Future loadCharacter() async {
    String body = await loadAsset();
      final jsondecode = json.decode(body);
      Character char = new Character.fromJson(jsondecode);
      char.toString();
  }
}