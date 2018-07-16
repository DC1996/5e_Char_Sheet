import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Styling.dart' as style;

import 'package:char_sheet_5e/GlobalVariables.dart';

import 'dart:async';
import 'dart:io';

class SkillsRow extends StatefulWidget {
  final String skillName;
  int skillScore;

  SkillsRow(this.skillName, this.skillScore);

  @override
  SkillsRowState createState() => SkillsRowState();
}

class SkillsRowState extends State<SkillsRow> {


  @override
  Widget build(BuildContext context) {
    final double skillsRowWidth = MediaQuery.of(context).size.width * 0.75;

    return new GestureDetector(
      onTap: changeValue,
      child: new Container(
        width: skillsRowWidth,
        margin: new EdgeInsets.all(2.0),
        padding: new EdgeInsets.only(top: 3.5, bottom: 3.5),
        decoration: new BoxDecoration(
            color: Color(0xFFececec),
            shape: BoxShape.rectangle,
            boxShadow: [style.blackShadow],
            borderRadius: new BorderRadius.circular(8.0),
            border: new Border.all(
              width: 1.2,
              color: Colors.black,
            )
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
              width: skillsRowWidth * 0.68,
              child: new Text('${widget.skillName}'),
            ),
            new Text('${widget.skillScore.toString()}'),
          ],
        ),
      ),
    );
  }

  Future changeValue() async {
    await showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          title: new Text('${widget.skillName}'),
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: widget.skillScore.toString(),
                labelText: "Score",
              ),
              onSubmitted: writeSkillScore,
              onChanged: writeSkillScore,
            ),
          ],
      )
    );
  }

  void setSkillScore(String newSkillScore) {
    setState(() {
      widget.skillScore = int.tryParse(newSkillScore);
    });
  }

  Future<File> writeSkillScore(String newSkillScore) async {
    setSkillScore(newSkillScore);
    return storage.writeData('${widget.skillName}', int.tryParse(newSkillScore));
  }

}

