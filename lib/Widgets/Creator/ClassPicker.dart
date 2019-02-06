import 'package:flutter/material.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';
import 'package:char_sheet_5e/JsonModels/Classes_model.dart';

class ClassPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    final int pos = data.classList.classes.indexWhere((char) =>  char.name == data.character.charClass.className);

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
              Text(
                "Class: ",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.black,
                  splashColor: Color(0xFF1D1D1D),
                ),
                child: DropdownButton(
                  value: data.character.charClass.className,
                  items: data.classList.classes.map((Classes sClass) {
                    return new DropdownMenuItem<String>(
                      value: sClass.name,
                      child: Text(
                        sClass.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (String sClass) => data.changeClass(sClass),
                  iconSize: 35.0,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => ClassDescription(pos)))
            ],
          )
        ],
      ),
    );
  }
}

class ClassDescription extends StatelessWidget {
  final int i;

  ClassDescription(this.i);

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    int pos = data.subclassList.subclasses.indexWhere((subclass) => subclass.ofClass.name == data.classList.classes[i].name);
    return new SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: Center(
          child: Text(
            '${AppDataManager.of(context).classList.classes[i].name}', textAlign: TextAlign.center,)),
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                AppDataManager.of(context).subclassList.subclasses[pos].desc[0],
                maxLines: null,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
        ),
      ],
    );
  }
}
