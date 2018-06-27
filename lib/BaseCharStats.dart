import 'package:flutter/material.dart';
import 'CharImage.dart'; //zobrazenie obrázka character-u
import 'HealthBar.dart'; //HP zobrazenie
import 'InfoCont.dart'; //Initiate + AC zobrazenie

class BaseCharStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        children: <Widget>[
          new CharImage('images/test.png'), //obrazok charaktera
          new Column(
            children: <Widget>[
              new HealthBar(), //HP bar
              new Row(
                children: <Widget>[
                  new InfoCont('images/Init.png', '3'), //Initiative
                  new InfoCont('images/Armor.png', '12'), //Armor Class
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
