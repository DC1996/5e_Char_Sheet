import 'package:flutter/material.dart';
import 'Styling.dart' as style;
import 'AbilityRow.dart';

<<<<<<< HEAD
class Abilities{
  String name;
  int points, modifier, save;
  Abilities(String newName, int newPoints, int newModifier, int newSave){
    name = newName;
    points = newPoints;
    modifier = newModifier;
    save = newSave;
  }
}


Abilities Strenght('Strenght', 10, 3, 1);
Abilities Dexterity(${Dexterity}, 10, 3, 1);
=======
>>>>>>> 008b95db77381a2a2396ad83cf6125d8e2a0432b

class AbilityTable extends StatelessWidget {
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
              new AbilityRow('Strenght', '10', '+3', '+1'),
              new AbilityRow('Dexterity', '10', '+3', '+1'),
              new AbilityRow('Constitution', '10', '+3', '+1'),
              new AbilityRow('Inteligence', '10', '+3', '+1'),
              new AbilityRow('Wisdom', '10', '+3', '+1'),
              new AbilityRow('Charisma', '10', '+3', '+1'),
            ],
          ),
        ),
<<<<<<< HEAD
        boxShadow: [new BoxShadow(
          color: Colors.black,
          blurRadius: 6.0,
        )],
        color: Color(0xFF989898),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      alignment: Alignment.topCenter,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new AbilityRow(Strenght(), '10', '+3', '+1'),
          new AbilityRow('Dexterity', '10', '+3', '+1'),
          new AbilityRow('Constitution', '10', '+3', '+1'),
          new AbilityRow('Inteligence', '10', '+3', '+1'),
          new AbilityRow('Wisdom', '10', '+3', '+1'),
          new AbilityRow('Charisma', '10', '+3', '+1'),
        ],
      ),
=======
>>>>>>> 008b95db77381a2a2396ad83cf6125d8e2a0432b
    );
  }

}
