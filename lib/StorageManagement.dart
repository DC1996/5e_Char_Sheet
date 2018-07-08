import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:path_provider/path_provider.dart'; //potrebujeme na getApplicationDocumentsDirectory()

import 'package:char_sheet_5e/GlobalVariables.dart';

class StorageManagement {

  //zistujeme kde sa nachádza úložisko kde môže naša appka vytvárať súbory
  Future<String> get localPath async { //pre Andriod to je AppData/.. pre iOS je to NSDocumentDirectory/...
    final dir = await getApplicationDocumentsDirectory(); //nájde úložisko aplikácie na mobile kde môžeme vytvárať nové súbory,
    return dir.path; //vracia 'cestu'
  }

  //s touto funkciou vraciame súbor ktorý potrebuejme
  Future<File> get localFile async {
    final path = await localPath; //najprv potrebujeme cestu (kde je súbor?)
    return File('$path/char_Info.txt'); //vracia súbor
  }

  //čítanie zo súboru
  Future<String> readData() async {
    try {
      final file = await localFile; // potrebujeme súbor
      //ak súbor existuje ->
      if(file.existsSync()) {
        String body = await file.readAsString(); // načítame jeho obsah do stringu
        return body; //vraciame obsah
      }
      else {
        return 'set_new_value'; //kým súbor neexituje nemôžeme z neho čítať,
        // najrpv musíme niečo zapísať aby sa vytvoril a potom už môžeme
      }
    } catch (e) {
      return e.toString(); //toto je pre errory, ak náhodou sa niečo stane, aby nám kód ne-crash-ol
    }
  }

  //zápis do súboru
  Future<File> writeData(String data) async {
    final file = await localFile; //potrebujeme súbor
    return file.writeAsString("$data"); //zapíšeme...
  }

}