import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Styling.dart' as style;
import 'package:char_sheet_5e/GlobalVariables.dart';
import 'package:char_sheet_5e/StorageManagement.dart';

import 'package:char_sheet_5e/JsonModels/Character_model.dart';
import 'package:char_sheet_5e/App_Data_Manager.dart';

class AbilityRow extends StatelessWidget {
  final Ability ability;
  AbilityRow(this.ability);


  @override
  Widget build(BuildContext context) {
    final double abilityRowWidth = MediaQuery.of(context).size.width * 0.9;
    final AppDataManagerState data = AppDataManager.of(context);

    return new Container(
        width: abilityRowWidth,
        margin: new EdgeInsets.fromLTRB(2.0,2.5,2.0,2.5),
        decoration: new BoxDecoration(
          color:  Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(6.0),
          border: Border.all(color: Colors.white, width: 2.5,)
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
                  new Text(ability.name, style: style.ability,),
                ],
              ),
            ),
            new Column(
              children: <Widget>[
                new Text("Score", style: style.info),
                new Text("${ability.score}", style: style.score),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text("Modifier", style: style.info),
                new Text('${(ability.score - 10)/2 > 0 ? "+" : ""}${((ability.score - 10)/2).floor()}', style: style.mod),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text("Save", style: style.info), //condition for adding proficiency to saving throws
                new Text('${(ability.score - 10)/2 > 0 ? "+" : ""}${ability.save == true ?
                ((ability.score - 10)/2).floor()+ data.character.charProf :
                ((ability.score - 10)/2).floor()}', style: style.save),
              ],
            ),
          ],
        ),
      );
  }
}


