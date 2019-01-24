import 'package:flutter/material.dart';

import 'package:char_sheet_5e/GlobalVariables.dart';
import 'package:char_sheet_5e/JsonModels/Races_model.dart';

class RacePicker extends StatefulWidget {
  @override
  _RacePickerState createState() => _RacePickerState();
}

class _RacePickerState extends State<RacePicker> {
  List<DropdownMenuItem<String>> dropDownMenuItems;
  String currentRace;

  @override
  void initState() {
    dropDownMenuItems = getDropDownMenuItems();
    currentRace = dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (Race race in raceList.races) {
      items.add(
          new DropdownMenuItem(
          value: race.name,
          child: new Text(race.name, style: TextStyle(color: Colors.white, fontSize: 16.0,)),
          ));
    }
    return items;
  }

  void changedDropDownItem(String selectedRace) {
    setState(() {
      currentRace = selectedRace;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      padding: new EdgeInsets.fromLTRB(10.0, 5.0, 8.0, 5.0),
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Race: ", style: TextStyle(color: Colors.white, fontSize: 18.0),),
              Theme(
                data: Theme.of(context).copyWith(
                canvasColor: Colors.black,
                splashColor: Color(0xFF1D1D1D),
                ),
                child: DropdownButton(value: currentRace, items: dropDownMenuItems, onChanged: changedDropDownItem, iconSize: 35.0,),),
              IconButton(icon: Icon(Icons.info_outline, color: Colors.white,), onPressed: null)
            ],
          )
        ],
      ),
    );
  }
}

