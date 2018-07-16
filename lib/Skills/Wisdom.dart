import 'package:flutter/material.dart';

import 'package:char_sheet_5e/GlobalVariables.dart';
import 'SkillsRow.dart';

class WisdomSkills extends StatefulWidget {
  final String abilityName;

  WisdomSkills(this.abilityName);

  @override
  WisdomSkillsState createState() => WisdomSkillsState();
}

class WisdomSkillsState extends State<WisdomSkills> {
  int animalHandling;
  int insight;
  int medicine;
  int perception;
  int survival;

  @override
  void initState() {
    storage.readData('Animal Handling').then((String score) {
      setState(() {
        animalHandling = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Insight').then((String score) {
      setState(() {
        insight = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Medicine').then((String score) {
      setState(() {
        medicine = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Perception').then((String score) {
      setState(() {
        perception = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Survival').then((String score) {
      setState(() {
        survival = int.tryParse(score ?? "0") ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      title: new Center(
        child: Text('${widget.abilityName}'),
      ),
      children: <Widget>[
        new SkillsRow('Animal Handling', animalHandling),
        new SkillsRow('Insight', insight),
        new SkillsRow('Medicine', medicine),
        new SkillsRow('Perception', perception),
        new SkillsRow('Survival', survival)
      ],
    );
  }
}