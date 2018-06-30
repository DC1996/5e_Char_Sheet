import 'package:flutter/material.dart';
import 'Styling.dart' as style;

import 'dart:async';

class AbilityRow extends StatefulWidget {

  final abilityName;
  AbilityRow(this.abilityName);

  @override
  AbilityRowState createState() => AbilityRowState(abilityName);
}

class AbilityRowState extends State<AbilityRow> {

  AbilityRowState(this.abilityName);

  String abilityName;
  int abilityScore = 0;
  int abilityMod = 0;
  int abilitySave = 0;

  @override
  Widget build(BuildContext context) {
    final double abilityRowWidth = MediaQuery.of(context).size.width * 0.9;

    return new GestureDetector(
      onLongPress: changeAbValues,
      child: new Container(
        width: abilityRowWidth,
        margin: new EdgeInsets.all(2.0),
        padding: new EdgeInsets.only(top: 3.5, bottom: 3.5),
        decoration: new BoxDecoration(
            color:  Color(0xFFececec),
            shape: BoxShape.rectangle,
            boxShadow: [style.blackShadow],
            borderRadius: new BorderRadius.circular(8.0),
            border: new Border.all(
              width: 2.5,
              color: Colors.black,
            )
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
              width: abilityRowWidth/2.33,
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
                new Text(abilityScore.toString(), style: style.score,),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text('+${abilityMod.toString()}', style: style.mod,),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text('+${abilitySave.toString()}', style: style.save,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---- STATE CHANGING FUNCTIONS ----
  void setAbilityScore(String newAbScore) {
    setState(() {
      abilityScore = int.tryParse(newAbScore);
    });
  }

  void setAbilityMod(String newAbMod) {
    setState(() {
      abilityMod = int.tryParse(newAbMod);
    });
  }

  void setAbilitySave(String newAbSave) {
    setState(() {
      abilitySave = int.tryParse(newAbSave);
    });
  }

  // ---- FUNCTIONALITY FUNCTIONS ----
  Future changeAbValues() async { //menime meno charaktera <= XDD wtf David
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
              onSubmitted: setAbilityScore,
              onChanged: setAbilityScore,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                labelText: "Mod",
                hintText: abilityMod.toString(),
              ),
              onSubmitted: setAbilityMod,
              onChanged: setAbilityMod,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                labelText: "Save",
                hintText: abilitySave.toString(),
              ),
              onSubmitted: setAbilitySave,
              onChanged: setAbilitySave,
            ),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Done')),
          ],
        )
    );
  }

}

