import 'package:flutter/material.dart';
import 'Styling.dart' as style;
import 'AbilityRow.dart';

class AbilityTable extends StatefulWidget {
  @override
  AbilityTableState createState() => AbilityTableState();
}

class AbilityTableState extends State<AbilityTable> {


  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        height: (MediaQuery.of(context).size.height * 0.5),
        width: MediaQuery.of(context).size.width * 0.95,
        margin: new EdgeInsets.all(8.6),
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Colors.black,
            width: 4.0,
            style: BorderStyle.solid,
          ),
          boxShadow: [style.blackShadow],
          color: Color(0xFF989898),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
        ),
        alignment: Alignment.topCenter,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new AbilityRow('Strenght'),
            new AbilityRow('Dexterity'),
            new AbilityRow('Constitution'),
            new AbilityRow('Inteligence'),
            new AbilityRow('Wisdom'),
            new AbilityRow('Charisma'),
          ],
        ),
      ),
    );
  }
}

