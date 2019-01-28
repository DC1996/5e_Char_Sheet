import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Styling.dart' as style;
import 'package:char_sheet_5e/Widgets/Home/AbilityRow.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';

class CharacterAbilityTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: GestureDetector(
      onLongPress: () => showDialog(
          context: context, builder: (context) => ChangeAbilityScores()),
      child: Container(
        height: (MediaQuery.of(context).size.height * 0.4),
        width: MediaQuery.of(context).size.width * 0.975,
        margin: new EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
        decoration: new BoxDecoration(
          border: new Border.all(
            //color: Colors.grey,
            width: 2.0,
          ),
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(5.0),
        ),
        alignment: Alignment.topCenter,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AbilityRow(0),
            AbilityRow(1),
            AbilityRow(2),
            AbilityRow(3),
            AbilityRow(4),
            AbilityRow(5),
          ],
        ),
      ),
    ));
  }
}

class ChangeAbilityScores extends StatefulWidget {
  @override
  _ChangeAbilityScoresState createState() => _ChangeAbilityScoresState();
}

class _ChangeAbilityScoresState extends State<ChangeAbilityScores> {
  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: Center(
        child: Text("Ability Scores"),
      ),
      children: <Widget>[
        AbilityValue(0),
        AbilityValue(1),
        AbilityValue(2),
        AbilityValue(3),
        AbilityValue(4),
        AbilityValue(5),
      ],
    );
  }
}

class AbilityValue extends StatefulWidget {
  final int ability;

  AbilityValue(this.ability);

  @override
  _AbilityValueState createState() => _AbilityValueState();
}

class _AbilityValueState extends State<AbilityValue> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.8;
    final AppDataManagerState data = AppDataManager.of(context);

    return new Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      new Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.black, width: 3.0)),
        height: MediaQuery.of(context).size.height * 0.055,
        width: width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: width / 2.7,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    data.character.charAbTable.abilities[widget.ability].name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
            ),
            new IconButton(icon: Icon(Icons.add, color: Colors.black,), onPressed: () => data.saveAbilityScore(widget.ability, true), splashColor: Colors.white.withOpacity(0.0),),
            Text(data.character.charAbTable.abilities[widget.ability].score.toString(), style: TextStyle(fontSize: 18.0),),
            new IconButton(icon: Icon(Icons.remove, color: Colors.black), onPressed: () => data.saveAbilityScore(widget.ability, false)),
            Padding(
                padding: EdgeInsets.only(left: 8.5),
                child: Text(
                  "Save Proficiency",
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
            Checkbox(
                activeColor: Colors.black,
                value: data.character.charAbTable.abilities[widget.ability].save,
                onChanged: (bool save) => data.saveStuff(save, widget.ability)
            )
          ],
        ),
      ),
    ]));
  }
}
