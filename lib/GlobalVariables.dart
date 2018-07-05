import 'dart:io';

File jsonFile;

String charName = "Gregor Salenski";

List<String> charClasses = ["Barbarian","Bard","Cleric","Druid","Fighter","Monk","Paladin","Ranger","Rogue","Sorcerer","Warlock","Wizard"].toList();
String charClass = charClasses.elementAt(4);
int classLevel = 2;

String charImage = 'images/char_Image.png';

int charHP = 10;
int charAC = 14;
int charInit = 3;