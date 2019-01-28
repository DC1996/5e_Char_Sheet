import 'dart:io';
import 'StorageManagement.dart';
import 'package:char_sheet_5e/JsonModels/Character_model.dart';
import 'package:char_sheet_5e/JsonModels/Spells_model.dart';
import 'package:char_sheet_5e/JsonModels/Races_model.dart';
import 'package:char_sheet_5e/JsonModels/Classes_model.dart';

import 'package:async/async.dart';

ListSpells spellBook;
ListRaces raceList;
ListClasses classList;

AsyncMemoizer<bool> memo = AsyncMemoizer();


File jsonFile;
String fileName = "ey.json";

/* **** ABILITY VALUES SU RIEŠENÉ INÁČ (pozri AbilityRow.dart)**** */