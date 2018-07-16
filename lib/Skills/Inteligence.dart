import 'package:flutter/material.dart';

import 'package:char_sheet_5e/GlobalVariables.dart';
import 'SkillsRow.dart';

class IntelligenceSkills extends StatefulWidget {
  final String abilityName;

  IntelligenceSkills(this.abilityName);

  @override
  IntelligenceSkillsState createState() => IntelligenceSkillsState();
}

class IntelligenceSkillsState extends State<IntelligenceSkills> {
  int arcana;
  int history;
  int investigation;
  int nature;
  int religion;

  @override
  void initState() {
    storage.readData('Arcana').then((String score) {
      setState(() {
        arcana = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('History').then((String score) {
      setState(() {
        history = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Investigation').then((String score) {
      setState(() {
        investigation = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Nature').then((String score) {
      setState(() {
        nature = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Religion').then((String score) {
      setState(() {
        religion = int.tryParse(score ?? "0") ?? 0;
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
        new SkillsRow('Arcana', arcana),
        new SkillsRow('History', history),
        new SkillsRow('Investigation', investigation),
        new SkillsRow('Nature', nature),
        new SkillsRow('Religion', religion)
      ],
    );
  }
}