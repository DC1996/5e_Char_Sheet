import 'package:flutter/material.dart';
import 'Styling.dart' as style;

class AbilityRow extends StatelessWidget {

  final String abilityName;
  final String abilityScore;
  final String abilityMod;
  final String abilitySave;

  AbilityRow(
      this.abilityName,
      this.abilityScore,
      this.abilityMod,
      this.abilitySave,
      );

  @override
  Widget build(BuildContext context) {
    final double abilityRowWidth = MediaQuery.of(context).size.width * 0.9;
    return new Container(
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
              width: abilityRowWidth/2.45,
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
                new Text(abilityScore, style: style.score,),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text(abilityMod, style: style.mod,),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text(abilitySave, style: style.save,),
              ],
            ),
          ],
        ),
    );
  }
}
