import 'dart:io';
import 'StorageManagement.dart';
import 'package:char_sheet_5e/JsonModels/Character_model.dart';
import 'package:char_sheet_5e/JsonModels/Spells_model.dart';

import 'package:async/async.dart';

final StorageManagement storage = new StorageManagement();
Character character;
ListSpells spellBook;

AsyncMemoizer<bool> memo = AsyncMemoizer();


File jsonFile;
String fileName = "character.json";


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