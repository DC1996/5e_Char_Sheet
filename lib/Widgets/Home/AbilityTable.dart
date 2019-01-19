import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Styling.dart' as style;
import 'package:char_sheet_5e/Widgets/Home/AbilityRow.dart';

class AbilityTable2 extends StatefulWidget {
  @override
  AbilityTable2State createState() => AbilityTable2State();
}

class AbilityTable2State extends State<AbilityTable2> {

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: (MediaQuery.of(context).size.height * 0.42),
        width: MediaQuery.of(context).size.width * 0.975,
        margin: new EdgeInsets.fromLTRB(5.0,0.0,5.0,5.0),
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
            new AbilityRow('Strenght', Color(0xFFD82735)),
            new AbilityRow('Dexterity', Color(0xFF009E47)),
            new AbilityRow('Constitution', Color(0xFFFFA135)),
            new AbilityRow('Intelligence', Color(0xFF0079E7)),
            new AbilityRow('Wisdom', Color(0xFF7D3CB5)),
            new AbilityRow('Charisma', Color(0xFFFE79D1)),
          ],
        ),
      );
  }
}

