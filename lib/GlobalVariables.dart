import 'dart:io';
import 'StorageManagement.dart';

final StorageManagement storage = new StorageManagement();

File jsonFile;
String fileName = "char_info.json";


/* **** CHARACTER VARIABLES **** */
//appbar
String charName;

//charImage
final List<String> charClasses = ["Barbarian","Bard","Cleric","Druid","Fighter","Monk","Paladin","Ranger","Rogue","Sorcerer","Warlock","Wizard"].toList();
String charClass;
int classLevel;
String charImage;

//healthBar
int charHP;

//InfoContAC
int charAC;

//InfoContInit
int charInit;

/* **** ABILITY VALUES SU RIEŠENÉ INÁČ (pozri AbilityRow.dart)**** */