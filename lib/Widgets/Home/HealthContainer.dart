import 'package:flutter/material.dart';
import 'package:char_sheet_5e/auto_size_text.dart';
import 'package:char_sheet_5e/App_Data_Manager.dart';

class HealthCont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => changeHP(context),
      onTap: null,
      child: Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.26,
          margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.redAccent[700],
                    spreadRadius: 1,
                    blurRadius: 2.5)
              ],
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0)),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "HP",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                ),
                new Text(
                  AppDataManager.of(context).character.charHealth.currentHP.toString(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.075),
                )
              ])),
    );
  }

  Future changeHP(BuildContext context) async { //changes the character name
    showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          title: Center(child: new Text("Max Health Points")),
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
              ),
              controller: TextEditingController(text: AppDataManager.of(context).character.charHealth.currentHP.toString()),
              onSubmitted: (String health) => Navigator.of(context).pop(AppDataManager.of(context).saveHealth(health)),
            ),
          ],
        )
    );
  }
}
