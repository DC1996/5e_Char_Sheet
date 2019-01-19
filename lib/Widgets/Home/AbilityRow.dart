import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Styling.dart' as style;
import 'package:char_sheet_5e/GlobalVariables.dart';

import 'package:char_sheet_5e/Skills/Strenght.dart';
import 'package:char_sheet_5e/Skills/Charisma.dart';
import 'package:char_sheet_5e/Skills/Dexterity.dart';
import 'package:char_sheet_5e/Skills/Inteligence.dart';
import 'package:char_sheet_5e/Skills/Wisdom.dart';


import 'dart:async';
import 'dart:io';

class AbilityRow extends StatefulWidget {
  Color color;
  final abilityName;
  AbilityRow(this.abilityName, this.color);

  @override
  AbilityRowState createState() => AbilityRowState(abilityName);
}

class AbilityRowState extends State<AbilityRow> {

  AbilityRowState(this.abilityName);

  String abilityName;

  int abilityScore;
  int abilityMod;
  int abilitySave;

  @override
  void initState() {
    //načítanie podla abilityName-u na začiatku vytvorenia widgetu
    readAbilityValues(abilityName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double abilityRowWidth = MediaQuery.of(context).size.width * 0.9;

    return new GestureDetector(
      onTap: displaySkill,
      onLongPress: changeAbValues,
      child: new Container(
        width: abilityRowWidth,
        margin: new EdgeInsets.fromLTRB(2.0,2.5,2.0,2.5),
        //padding: new EdgeInsets.only(top: 3.5, bottom: 3.5),
        decoration: new BoxDecoration(
          color:  Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(6.0),
          border: Border.all(
              color: widget.color,
              width: 1.5
          ),
          //boxShadow: [BoxShadow(color: widget.color, blurRadius: 1.5, spreadRadius: 1.0)]
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
              width: abilityRowWidth/2.33,
              margin: EdgeInsets.only(bottom: 1.0),
              alignment: Alignment.centerLeft,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(abilityName, style: style.ability,),
                ],
              ),
            ),
            new Column(
              children: <Widget>[
                new Text("Score", style: style.info),
                new Text(abilityScore.toString(), style: style.score),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text("Modifier", style: style.info),
                new Text('+${abilityMod.toString()}', style: style.mod),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text("Save", style: style.info),
                new Text('+${abilitySave.toString()}', style: style.save),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---- STATE CHANGING FUNCTIONS & WRITING TO FILE ----
  void setAbilityScore(String newAbScore) {
    setState(() {
      abilityScore = int.tryParse(newAbScore);
    });
  }

  Future<File> writeAbilityScore(String newAbScore) async {
    setAbilityScore(newAbScore);
    return storage.writeData('$abilityName-Score', int.tryParse(newAbScore));
  }

  void setAbilityMod(String newAbMod) {
    setState(() {
      abilityMod = int.tryParse(newAbMod);
    });
  }

  Future<File> writeAbilityMod(String newAbMod) async {
    setAbilityMod(newAbMod);
    return storage.writeData('$abilityName-Mod', int.tryParse(newAbMod));
  }

  void setAbilitySave(String newAbSave) {
    setState(() {
      abilitySave = int.tryParse(newAbSave);
    });
  }

  Future<File> writeAbilitySave(String newAbSave) async {
    setAbilitySave(newAbSave);
    return storage.writeData('$abilityName-Save', int.tryParse(newAbSave));
  }

  // ---- FUNCTIONALITY FUNCTIONS & INITIAL READ FUNCTION----
  Future changeAbValues() async {
    await showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          title: new Text("$abilityName's Values"),
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: abilityScore.toString(),
                labelText: "Score",
              ),
              onSubmitted: writeAbilityScore,
              onChanged: writeAbilityScore,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                labelText: "Mod",
                hintText: abilityMod.toString(),
              ),
              onSubmitted: writeAbilityMod,
              onChanged: writeAbilityMod,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                labelText: "Save",
                hintText: abilitySave.toString(),
              ),
              onSubmitted: writeAbilitySave,
              onChanged: writeAbilitySave,
            ),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Done')),
          ],
        )
    );
  }

  void readAbilityValues(String abName) async {
    storage.readData('$abilityName-Score').then((String currentAbScore) {
      setState(() {
        abilityScore = int.tryParse(currentAbScore ?? "0") ?? 0;
      });
    });
    storage.readData('$abilityName-Mod').then((String currentAbMod) {
      setState(() {
        abilityMod = int.tryParse(currentAbMod ?? "0") ?? 0;
      });
    });
    storage.readData('$abilityName-Save').then((String currentAbSave) {
      setState(() {
        abilitySave = int.tryParse(currentAbSave ?? "0") ?? 0;
      });
    });
  }

  Future displaySkill() async {
    if(abilityName == 'Strenght') await showDialog( context: context, builder: (_) => new StrenghtSkills(abilityName));
    if(abilityName == 'Dexterity') await showDialog( context: context, builder: (_) => new DexteritySkills(abilityName));
    if(abilityName == 'Intelligence') await showDialog( context: context, builder: (_) => new IntelligenceSkills(abilityName));
    if(abilityName == 'Wisdom') await showDialog( context: context, builder: (_) => new WisdomSkills(abilityName));
    if(abilityName == 'Charisma') await showDialog( context: context, builder: (_) => new CharismaSkills(abilityName));
  }

}


