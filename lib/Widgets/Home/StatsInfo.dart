import 'package:flutter/material.dart';
import 'HealthContainer.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';

class StatsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: new Border.all(
            //color: Colors.grey,
            width: 2.0,
          ),
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight:Radius.circular(10.0))
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new ArmorClassCont(),
          new HealthCont(),
          new ProficiencyCont()
        ],
      ),
    );
  }
}

class ArmorClassCont extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => changeAC(context),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            boxShadow: [BoxShadow(color: Colors.indigo, spreadRadius: 1, blurRadius: 2.5)],
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6.5)),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text(
                  "Armor Class",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                  ),
                ),
              ],
            ),
            new Text(
              AppDataManager.of(context).character.charAC.toString(),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.062),
            )
          ],
        ),
      ),
    );
  }

  Future changeAC(BuildContext context) async { //changes the character name
    showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          title: Center(child: new Text("Armor Class")),
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
              ),
              controller: TextEditingController(text: AppDataManager.of(context).character.charAC.toString()),
              onSubmitted: (String ac) => Navigator.of(context).pop(AppDataManager.of(context).changeAC(ac)),
            ),
          ],
        )
    );
  }

}

class ProficiencyCont extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => changeProf(context),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            boxShadow: [BoxShadow(color: Colors.indigo, spreadRadius: 1, blurRadius: 2.5)],
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6.5)),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text(
                  "Proficiency",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                  ),
                ),
              ],
            ),
            new Text(
              AppDataManager.of(context).character.charProf.toString(),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.062),
            )
          ],
        ),
      ),
    );
  }

  Future changeProf(BuildContext context) async { //changes the character name
    showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          title: Center(child: new Text("Proficiency")),
          children: <Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.1, child: new TextField(
              decoration: new InputDecoration(
              ),
              controller: TextEditingController(text: AppDataManager.of(context).character.charProf.toString()),
              onSubmitted: (String prof) => Navigator.of(context).pop(AppDataManager.of(context).changeProficiency(prof)),
            ),)
          ],
        )
    );
  }

}


