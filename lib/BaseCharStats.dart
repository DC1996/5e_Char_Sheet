import 'package:flutter/material.dart';
import 'CharImage.dart'; //zobrazenie obrázka character-u
import 'HealthBar.dart'; //HP zobrazenie
import 'InfoContInit.dart';
import 'InfoContAC.dart'; //Initiate + AC zobrazenie

class BaseCharStats extends StatefulWidget {
  @override
  BaseCharStatsState createState() => BaseCharStatsState();
}

class BaseCharStatsState extends State<BaseCharStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        children: <Widget>[
          new CharImage(), //obrazok charaktera
          new Column(
            children: <Widget>[
              new HealthBar(), //HP bar
              new Row(
                children: <Widget>[
                  new InfoContInit(), //Initiative
                  new InfoContAC(), //Armor Class
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}