import 'package:flutter/material.dart';
import 'Styling.dart' as style;

class AbilityRow extends StatelessWidget {

  final String abilityName;
  final String abilityPoints;
  final String abilityMod;
  final String abilitySave;

  AbilityRow(
      this.abilityName,
      this.abilityPoints,
      this.abilityMod,
      this.abilitySave,
      );

  final TextStyle values = new TextStyle(
    fontSize: 15.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  final TextStyle ability = new TextStyle(
    fontSize: 24.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final double abilityRowWidth = MediaQuery.of(context).size.width * 0.9;
    return new Container(
      width: abilityRowWidth,
      margin: new EdgeInsets.fromLTRB(
          2.0,
          2.0,
          2.0,
          2.0),
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
                  new Text(abilityName, style: ability,),
                ],
              ),
            ),
            new Column(
              children: <Widget>[
                new Text(abilityPoints, style: values,),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text(abilityMod, style: values,),
              ],
            ),
            new Column(
              children: <Widget>[
                new Text(abilitySave, style: values,),
              ],
            ),
          ],
       ),
    );
  }
}
