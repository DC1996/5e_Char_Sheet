import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Widgets/Home/AbilityRow.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';

class CharacterAbilityTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: GestureDetector(
      onLongPress: () => showDialog(
          context: context, builder: (context) => ModifyAbilityScoresDialog()),
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
            AbilityRow(0),
            AbilityRow(1),
            AbilityRow(2),
            AbilityRow(3),
            AbilityRow(4),
            AbilityRow(5),
          ],
        ),
      ),
    ));
  }
}

class ModifyAbilityScoresDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: Center(
        child: Text("Modify Ability Values"),
      ),
      children: <Widget>[
        AbilityValue(0),
        AbilityValue(1),
        AbilityValue(2),
        AbilityValue(3),
        AbilityValue(4),
        AbilityValue(5),
        Padding(padding: EdgeInsets.only(top: 2.5),
          child: Center(
            child: Text("Save Proficiencies",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.125,
          margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 20.0),
          padding: EdgeInsets.all(5.0),
          child: GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2.5),
              itemBuilder: (BuildContext context, int i) {
                return SavingProficiency(i);
              }
          ),
        )
      ],
    );
  }
}

class AbilityValue extends StatelessWidget {
  final int ability;

  AbilityValue(this.ability);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.8;
    final AppDataManagerState data = AppDataManager.of(context);

    return new Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      new Container(
        margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 8.0),
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.black, width: 3.0)),
        height: MediaQuery.of(context).size.height * 0.06,
        width: width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: width / 2.9,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    data.character.charAbTable.abilities[ability].name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
              /// SPLASH RADIUS ??? IT LOOK LIKE VOMIT WHEN YOU + or - !!!
            ),
            new IconButton(icon: Icon(Icons.add, color: Colors.black,), onPressed: () => data.modifyScore(ability, true), iconSize: 16.0,),
            Text(data.character.charAbTable.abilities[ability].score.toString(), style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
            new IconButton(icon: Icon(Icons.remove, color: Colors.black), onPressed: () => data.modifyScore(ability, false), iconSize: 16.0),
          ],
        ),
      ),
    ]));
  }
}

class SavingProficiency extends StatelessWidget {
  final int i;

  SavingProficiency(this.i);

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    final bool save = data.character.charAbTable.abilities[i].save;
    final String id = data.character.charAbTable.abilities[i].id;

    return Container(
      height: MediaQuery.of(context).size.height * 0.01,
      width: MediaQuery.of(context).size.width * 0.01,
      margin: EdgeInsets.all(1.5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(id, style: TextStyle(fontWeight: FontWeight.bold),),
          Checkbox(value: save, activeColor: Colors.black ,onChanged: (bool save) => data.saveStuff(save, i))
        ],
      ),
    );
  }
}
