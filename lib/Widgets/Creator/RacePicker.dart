import 'package:flutter/material.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';
import 'package:char_sheet_5e/JsonModels/Races_model.dart';

class RacePicker extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
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
                child: DropdownButton(
                  value: data.character.charRace,
                  items: data.raceList.races.map((Race race) {
                    return new DropdownMenuItem<String>(
                      value: race.name,  
                      child: Text(race.name, style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                  onChanged: (String race) => data.upDateCharRace(race),
                  iconSize: 35.0,),),
              IconButton(icon: Icon(Icons.info_outline, color: Colors.white,), onPressed: null)
            ],
          )
        ],
      ),
    );
  }
}

