import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Styling.dart' as style;

import 'package:char_sheet_5e/App_Data_Manager.dart';

class AbilityRow extends StatelessWidget {
  final int ability;
  AbilityRow(this.ability);

  @override
  Widget build(BuildContext context) {
    final double abilityRowWidth = MediaQuery.of(context).size.width * 0.9;
    final AppDataManagerState data = AppDataManager.of(context);

    //i am lazy and like to write down long ass code
    final int saveVal = data.character.charAbTable.abilities[ability].save == true ?
    (((data.character.charAbTable.abilities[ability].score - 10) / 2).floor() + data.character.charProf) :
    (((data.character.charAbTable.abilities[ability].score - 10) / 2).floor());

    return new GestureDetector(
      onTap: () => showDialog(
      context: context, builder: (context) => AbilityDescription(ability, data.character.charAbTable.abilities[ability].score.toString())), ///DESPERATE CHANGES NEEDED HERE TOMORROW (TODAY)
      child: Container(
        width: abilityRowWidth,
        margin: new EdgeInsets.fromLTRB(2.0, 2.5, 2.0, 2.5),
        decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(6.0),
            border: Border.all(
              color: Colors.white,
              width: 2.5,
            )),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
              width: abilityRowWidth / 2.33,
              margin: EdgeInsets.only(bottom: 1.0),
              alignment: Alignment.centerLeft,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    data.character.charAbTable.abilities[ability].name,
                    style: style.ability,
                  ),
                ],
              ),
            ),
            new Column(
              children: <Widget>[
                new Text("Score", style: style.info),
                new Text(data.character.charAbTable.abilities[ability].score.toString(),
                    style: style.score),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text("Modifier", style: style.info),
                new Text(
                    '${((data.character.charAbTable.abilities[ability].score - 10) / 2).floor() > 0 ? "+" : ""}${((data.character.charAbTable.abilities[ability].score - 10) / 2).floor()}',
                    style: style.mod),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text("Save",
                    style: style
                        .info), //condition for adding proficiency to saving throws
                new Text(
                    '${saveVal > 0 ? "+" : ""}${saveVal.toString()}',
                    style: style.save),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AbilityDescription extends StatelessWidget {
  final int i;
  final String value;

  AbilityDescription(this.i, this.value);

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    return new SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: Center(child: Text('${AppDataManager.of(context).abilityList.abilities[i].name} $value')),
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                AppDataManager.of(context).abilityList.abilities[i].desc,
                maxLines: null,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        ),
      ],
    );
  }
}
