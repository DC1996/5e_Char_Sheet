import 'package:flutter/material.dart'; //package pre widgety
import 'package:flutter/services.dart'; //package pre dalšie funkcie

import 'package:char_sheet_5e/AppDrawer.dart'; //zobrazenie riadka v drawer-i
import 'package:char_sheet_5e/BaseCharStats.dart'; //horná časť home page-u
import 'package:char_sheet_5e/InfoBar.dart'; // tie 4 kolonky nad Ability taublkou
import 'package:char_sheet_5e/AbilityHeader.dart'; //hlavička pre ability table
import 'package:char_sheet_5e/AbilityTable.dart'; //zobrazenie abilít
import 'package:char_sheet_5e/Character_model.dart';

import 'package:char_sheet_5e/GlobalVariables.dart'; // ---- GLOBAL VARIABLES ----

import 'dart:async';
import 'dart:io';


class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  void initState() {
    initRead();
    super.initState();
    //načítaj veci so súboru
  }

  @override
  Widget build(BuildContext context) {
    //blokuje otáčanie obrazovky
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //hlavná obrazovka
    return new Scaffold(
      resizeToAvoidBottomPadding: false, //toto zaistí, že keď pop-up-ne klavesnica tak sa nám ability table nezmenší ;)
      backgroundColor: Color(0xFFefefef),
      //App Drawer -------------------------
      drawer: appDrawer,
      //App Bar ----------------------------
      appBar: new AppBar(
        backgroundColor: Colors.black,
        iconTheme: new IconThemeData(color: Color(0xFFececec)),
        title: new GestureDetector(
          onLongPress: () => changeName(),
          child: FutureBuilder<Character>(
                  future: storage.loadCharacter(),
                  builder: (context, snapshot) {
                    //print(snapshot.data);
                    if(!snapshot.hasData) return Text("Loading...");
                    else return new Text(character.charName ?? "Enter a name");
              },
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.folder, color: Color(0xFFececec)),
              onPressed: null),
          new IconButton(icon: new Icon(Icons.settings, color: Color(0xFFececec)),
              onPressed: null),
        ],
      ),
      //App Body ---------------------------
      body: new SafeArea(   //
          child: new Column(
            children: <Widget>[
              new BaseCharStats(), //obrazok, HP, Initiative, armor Class
              //new InfoBar(), //4 kolonky pred tabulkou
              new AbilityHeader(),
              //new AbilityTable(),
            ],
          )
      ),
    );
  }

  // ---- STATE CHANGING FUNCTIONS ----
  void setName(String newName) {
    setState(() {
      character.charName = newName;
      Navigator.pop(context);
    });
      //print(character.charName);

  }

  // ---- FUNCTIONALITY FUNCTIONS ----
  Future changeName() async { //changes the character name
    await showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          title: new Text('Character Name'),
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                hintText: character.charName,
              ),
              onSubmitted: writeSetName, //ZMENA A ZÁPIS
            ),
          ],
        )
    );
  }

  // ---- STORAGE FUNCTIONS ----
  void writeSetName(String newName) async { //zmena a zápis charName do súboru
    setName(newName); //save new name in object
    storage.saveCharacter();
    //storage.loadCharacter(); //zapíš do súboru
    print(character.charName);
  }

  //stýmto načítam všetky premenné
  void initRead() async {
    //readCharName();
    readCharImage();
    readCharClass();
    readClassLevel();
    readCharHP();
    readCharAC();
    readCharInit();
  }

  // --- EVERY BLOODY VARIABLES READ FUNCTION?????? - yes :) ----
  Future<String> readCharName() async {
    return storage.readData('charName').then(((String currentCharName) {
      // print('$currentCharName'); (debugging...)
        setState(() {
          charName = currentCharName ?? "Enter Name";
        });
    }));
  }

  Future<String> readCharClass() async {
    return storage.readData('charClass').then(((String currentCharClass) {
      setState(() {
        charClass = currentCharClass ?? charClasses.elementAt(0);
      });
    }));
  }

  Future<String> readCharImage() async {
    return storage.readData('charImage').then(((String currentCharImage) {
      setState(() {
        charImage = currentCharImage ?? 'images/char_Image.png';
      });
    }));
  }

  Future<String> readClassLevel() async {
    return storage.readData('classLevel').then(((String currentClassLevel) {
      setState(() {
        classLevel = int.tryParse(currentClassLevel ?? "0") ?? 0;
      });
    }));
  }

  Future<String> readCharHP() async {
    return storage.readData('charHP').then((String currentCharHP) {
      setState(() {
        charHP = int.tryParse(currentCharHP ?? "0") ?? 0;
      });
    });
  }

  Future<String> readCharAC() async {
    return storage.readData('charAC').then((String currentCharAC) {
      setState(() {
        charAC = int.tryParse(currentCharAC ?? "0") ?? 0;
      });
    });
  }

  Future<String> readCharInit() async {
    return storage.readData('charInit').then((String currentCharInit) {
      setState(() {
        charInit = int.tryParse(currentCharInit ?? "0") ?? 0;
      });
    });
  }



}
