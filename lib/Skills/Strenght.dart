import 'package:flutter/material.dart';

import 'package:char_sheet_5e/GlobalVariables.dart';
import 'SkillsRow.dart';

class StrenghtSkills extends StatefulWidget {
  final String abilityName;

  StrenghtSkills(this.abilityName);

  @override
  StrenghtSkillsState createState() => StrenghtSkillsState();
}

class StrenghtSkillsState extends State<StrenghtSkills> {
  int athletics;

  @override
  void initState() {
    storage.readData('Athletics').then((String score) {
      setState(() {
        athletics = int.tryParse(score ?? "0") ?? 0;
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
        new SkillsRow('Athletics', athletics),
      ],
    );
  }
}
