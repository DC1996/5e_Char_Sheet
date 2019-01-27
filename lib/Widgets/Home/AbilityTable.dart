import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Styling.dart' as style;
import 'package:char_sheet_5e/Widgets/Home/AbilityRow.dart';

import 'package:char_sheet_5e/GlobalVariables.dart';
import 'package:char_sheet_5e/App_Data_Manager.dart';

class CharacterAbilityTable extends StatefulWidget {
  @override
  CharacterAbilityTableState createState() => CharacterAbilityTableState();
}

class CharacterAbilityTableState extends State<CharacterAbilityTable> {
  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);

    return new Expanded(
        child: GestureDetector(
      onLongPress: () =>
          showDialog(context: context, builder: (context) => ChangeAbilityScores()),
      child: Container(
        height: (MediaQuery.of(context).size.height * 0.4),
        width: MediaQuery.of(context).size.width * 0.975,
        margin: new EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
        decoration: new BoxDecoration(
          border: new Border.all(
            //color: Colors.grey,
            width: 2.0,
          ),
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(5.0),
        ),
        alignment: Alignment.topCenter,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AbilityRow(data.character.charAbTable.strength),
            AbilityRow(data.character.charAbTable.dexterity),
            AbilityRow(data.character.charAbTable.constitution),
            AbilityRow(data.character.charAbTable.intelligence),
            AbilityRow(data.character.charAbTable.wisdom),
            AbilityRow(data.character.charAbTable.charisma),
          ],
        ),
      ),
    ));
  }
}

class ChangeAbilityScores extends StatefulWidget {
  @override
  _ChangeAbilityScoresState createState() => _ChangeAbilityScoresState();
}

class _ChangeAbilityScoresState extends State<ChangeAbilityScores> {
  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    var width = MediaQuery.of(context).size.width * 0.8;

    return new SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: Center(
        child: Text("Ability Scores"),
      ),
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.black, width: 3.0)),
                height: MediaQuery.of(context).size.height * 0.055,
                width: width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width/2.6,
                      child:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            data.character.charAbTable.strength.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Flexible(
                        flex: 1,
                        child: TextField(
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 18.0,),
                          controller: TextEditingController(text: data.character.charAbTable.strength.score.toString()),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: InputBorder.none,
                          ),
                          autocorrect: false,
                          onSubmitted: (String newValue) => setState(() {
                            data.character.charAbTable.strength.score = int.tryParse(newValue);
                            data.storage.saveCharacter(data.character);
                          }),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 8.5),
                        child: Text(
                          "Save Proficiency",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                    Checkbox(
                        activeColor: Colors.black,
                        value: data.character.charAbTable.strength.save,
                        onChanged: (bool save) => setState(() {
                          data.character.charAbTable.strength.save = save;
                          data.storage.saveCharacter(data.character);//save new name in object
                        })
                    )
                  ],
                ),),
              new Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.black, width: 3.0)),
                height: MediaQuery.of(context).size.height * 0.055,
                width: width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width/2.6,
                      child:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            data.character.charAbTable.dexterity.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Flexible(
                        flex: 1,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 18.0,),
                          controller: TextEditingController(text: data.character.charAbTable.dexterity.score.toString()),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: InputBorder.none,
                          ),
                          autocorrect: false,
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 8.5),
                        child: Text(
                          "Save Proficiency",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                    Checkbox(
                        activeColor: Colors.black,
                        value: data.character.charAbTable.dexterity.save,
                        onChanged: (bool save) => setState(() { //save new name in object
                        })
                    )
                  ],
                ),),
              new Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.black, width: 3.0)),
                height: MediaQuery.of(context).size.height * 0.055,
                width: width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width/2.6,
                      child:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            data.character.charAbTable.constitution.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Flexible(
                        flex: 1,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 18.0,),
                          controller: TextEditingController(text: data.character.charAbTable.constitution.score.toString()),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: InputBorder.none,
                          ),
                          autocorrect: false,
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 8.5),
                        child: Text(
                          "Save Proficiency",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                    Checkbox(
                        activeColor: Colors.black,
                        value: data.character.charAbTable.constitution.save,
                        onChanged: (bool save) => setState(() { //save new name in object
                        })
                    )
                  ],
                ),),
              new Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.black, width: 3.0)),
                height: MediaQuery.of(context).size.height * 0.055,
                width: width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width/2.6,
                      child:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            data.character.charAbTable.intelligence.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Flexible(
                        flex: 1,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 18.0,),
                          controller: TextEditingController(text: data.character.charAbTable.intelligence.score.toString()),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: InputBorder.none,
                          ),
                          autocorrect: false,
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 8.5),
                        child: Text(
                          "Save Proficiency",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                    Checkbox(
                        activeColor: Colors.black,
                        value: data.character.charAbTable.intelligence.save,
                        onChanged: (bool save) => setState(() { //save new name in object
                        })
                    )
                  ],
                ),),
              new Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.black, width: 3.0)),
                height: MediaQuery.of(context).size.height * 0.055,
                width: width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width/2.6,
                      child:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            data.character.charAbTable.wisdom.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Flexible(
                        flex: 1,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 18.0,),
                          controller: TextEditingController(text: data.character.charAbTable.wisdom.score.toString()),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: InputBorder.none,
                          ),
                          autocorrect: false,
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 8.5),
                        child: Text(
                          "Save Proficiency",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                    Checkbox(
                        activeColor: Colors.black,
                        value: data.character.charAbTable.wisdom.save,
                        onChanged: (bool save) => setState(() { //save new name in object
                        })
                    )
                  ],
                ),),
              new Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.black, width: 3.0)),
                height: MediaQuery.of(context).size.height * 0.055,
                width: width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width/2.6,
                      child:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            data.character.charAbTable.charisma.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Flexible(
                        flex: 1,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 18.0,),
                          controller: TextEditingController(text: data.character.charAbTable.charisma.score.toString()),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: InputBorder.none,
                          ),
                          autocorrect: false,
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 8.5),
                        child: Text(
                          "Save Proficiency",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                    Checkbox(
                        activeColor: Colors.black,
                        value: data.character.charAbTable.charisma.save,
                        onChanged: (bool save) => setState(() { //save new name in object
                        })
                    )
                  ],
                ),),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.85,
        )
      ],
    );
  }
}
