import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Widgets/Home/AbilityRow.dart';
import 'package:char_sheet_5e/Widgets/Home/StatsInfo.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';

class CharacterAbilityTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => showDialog(
          context: context, builder: (context) => ModifyAbilityScoresDialog()),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.975,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.007),
        decoration: new BoxDecoration(
          border: new Border.all(
            //color: Colors.grey,
            width: 2.0,
          ),
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight:Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight:Radius.circular(10.0)
          ),
        ),
        alignment: Alignment.topCenter,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            StatsInfo(),
            AbilityRow(0),
            AbilityRow(1),
            AbilityRow(2),
            AbilityRow(3),
            AbilityRow(4),
            AbilityRow(5),
          ],
        ),
      ),
    );
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
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Center(
            child: Text("Save Proficiencies:",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.62,
          height: MediaQuery.of(context).size.height * 0.11,
          margin: EdgeInsets.symmetric(
              vertical: 2.5,
              horizontal: 5.0),
          padding: EdgeInsets.all(5.0),
          child: GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3.3,
                mainAxisSpacing: 2.5,
                crossAxisSpacing: 2.0,
              ),
              itemBuilder: (BuildContext context, int i) {
                return SavingProficiency(i);
              }),
        ),
        Center(
            child: FlatButton(
          child: Text(
            "Done",
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: Navigator.of(context).pop,
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ))
      ],
    );
  }
}

class AbilityValue extends StatelessWidget {
  final int i;

  AbilityValue(this.i);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.8;
    final AppDataManagerState data = AppDataManager.of(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 5.0),
      padding: EdgeInsets.all(2.0),
      height: MediaQuery.of(context).size.height * 0.06,
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: width / 2.4,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  data.character.charAbTable.abilities[i].name,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.029,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),

            /// SPLASH RADIUS ??? IT LOOK LIKE VOMIT WHEN YOU + or - !!!
          ),
          new IconButton(
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.black,
              size: 20.0,
            ),
            alignment: Alignment.center,
            onPressed: () => data.modifyScore(i, false),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.1, child: Center(child: Text(
            data.character.charAbTable.abilities[i].score.toString(),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),)),
          new IconButton(
            icon: Icon(
              Icons.arrow_upward,
              color: Colors.black,
              size: 20.0,
            ),
            alignment: Alignment.center,
            onPressed: () => data.modifyScore(i, true),
          ),
        ],
      ),
    );
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width * 0.08, child: Text(
            id,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
          ),),
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: save,
              activeColor: Colors.black,
              onChanged: (bool save) => data.updateSaveProf(save, i))
        ],
      ),
    );
  }
}
