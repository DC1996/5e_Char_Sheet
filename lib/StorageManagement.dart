import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

import 'package:char_sheet_5e/GlobalVariables.dart';

class StorageManagement {

  //zistujeme kde sa nachádza úložisko kde môže naša appka vytvárať súbory
  Future<String> get localPath async { //pre Andriod to je AppData/.. pre iOS je to NSDocumentDirectory/...
    final dir = await getApplicationDocumentsDirectory(); //nájde úložisko aplikácie na mobile kde môžeme vytvárať nové súbory
    return dir.path; //vracia 'cestu'
  }

  Future<File> get localFile async {
    final String path = await localPath;
    return File('$path/char_info.json');
  }

  void createFile() async {
    jsonFile = await localFile;
  }

  Future<String> readFile(String key) async {
    try {
      final file = jsonFile;
      Map<String, String> jsonFileContent = await json.decode(file.readAsStringSync());
      return jsonFileContent[key];
    } catch(e) {
      return e.toString();
    }
  }

  void writeToFile(String key, dynamic value) async {
    Map<String, dynamic> content = {key: value};
    final file = jsonFile;
    Map<String, String> jsonFileContent = await json.decode(file.readAsStringSync());
      jsonFileContent.addAll(content);
      file.writeAsStringSync(json.encode(jsonFileContent));
  }

  void writeInit() async {
    writeToFile('charName', "Char_Name");
    writeToFile('charClass', charClasses.elementAt(0));
    writeToFile('classLevel', 1);
    writeToFile('charImage', 'images/char_Image.png');
  }

  void initVariables() async {
    writeInit();
    //charName = readFile('charName');
    //charClass = readFile('charClass');
  }

}