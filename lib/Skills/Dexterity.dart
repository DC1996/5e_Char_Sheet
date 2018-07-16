import 'package:flutter/material.dart';

import 'package:char_sheet_5e/GlobalVariables.dart';
import 'SkillsRow.dart';

class DexteritySkills extends StatefulWidget {
  final String abilityName;

  DexteritySkills(this.abilityName);

  @override
  DexteritySkillsState createState() => DexteritySkillsState();
}

class DexteritySkillsState extends State<DexteritySkills> {
  int acrobatics;
  int sleightOfHand;
  int stealth;

  @override
  void initState() {
    storage.readData('Acrobatics').then((String score) {
      setState(() {
        acrobatics = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Sleight of Hand').then((String score) {
      setState(() {
        sleightOfHand = int.tryParse(score ?? "0") ?? 0;
      });
    });
    storage.readData('Stealth').then((String score) {
      setState(() {
        stealth = int.tryParse(score ?? "0") ?? 0;
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
        new SkillsRow('Acrobatics', acrobatics),
        new SkillsRow('Sleight of Hand', sleightOfHand),
        new SkillsRow('Stealth', stealth),
      ],
    );
  }
}