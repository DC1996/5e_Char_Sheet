import 'package:flutter/material.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';
import 'package:char_sheet_5e/JsonModels/Races_model.dart';

class RacePicker extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    final int pos = data.raceList.races.indexWhere((char) =>  char.name == data.character.charRace);

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
                  onChanged: (String race) => data.changeRace(race),
                  iconSize: 35.0,),),
              IconButton(icon: Icon(Icons.info_outline, color: Colors.white,), onPressed: () => showDialog(
                  context: context,
                  builder: (context) => RaceDescription(pos)))
            ],
          )
        ],
      ),
    );
  }
}

class RaceDescription extends StatelessWidget {
  final int i;

  RaceDescription(this.i);

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: Center(
          child: Text(
            '${AppDataManager.of(context).raceList.races[i].name}', textAlign: TextAlign.center,)),
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Size: ${AppDataManager.of(context).raceList.races[i].size_description}', maxLines: null, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),),
              Padding(padding: EdgeInsets.all(1.5)),
              Text('Age: ${AppDataManager.of(context).raceList.races[i].age}', maxLines: null, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),),
              Padding(padding: EdgeInsets.all(1.5)),
              Text('Alignmet: ${AppDataManager.of(context).raceList.races[i].alignment}', maxLines: null, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),),
              Padding(padding: EdgeInsets.all(1.5)),
              Text('Languages: ${AppDataManager.of(context).raceList.races[i].language_desc}', maxLines: null, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),),
              //Text('Languages: ${AppDataManager.of(context).raceList.races[i].languages}', maxLines: null, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),),
            ],
          ),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
        ),
      ],
    );
  }
}