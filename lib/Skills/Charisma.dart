import 'package:flutter/material.dart';

import 'package:char_sheet_5e/GlobalVariables.dart';
import 'SkillsRow.dart';

class CharismaSkills extends StatefulWidget {
  final String abilityName;

  CharismaSkills(this.abilityName);

  @override
  CharismaSkillsState createState() => CharismaSkillsState();
}

class CharismaSkillsState extends State<CharismaSkills> {
  int deception;
  int intimidation;
  int performance;
  int persuasion;

  @override
  void initState() {
    storage.readData('Deception').then((String score) {
      setState(() {
        deception = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Intimidation').then((String score) {
      setState(() {
        intimidation = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Performance').then((String score) {
      setState(() {
        performance = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Persuasion').then((String score) {
      setState(() {
        persuasion = int.tryParse(score ?? "0") ?? 0;
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
        new SkillsRow('Deception', deception),
        new SkillsRow('Intimidation', intimidation),
        new SkillsRow('Performance', performance),
        new SkillsRow('Persuasion', persuasion)
      ],
    );
  }
}