import 'package:flutter/material.dart';

import 'package:char_sheet_5e/GlobalVariables.dart';
import 'package:char_sheet_5e/JsonModels/Classes_model.dart';

class ClassPicker extends StatefulWidget {
  @override
  _ClassPickerState createState() => _ClassPickerState();
}

class _ClassPickerState extends State<ClassPicker> {
  List<DropdownMenuItem<String>> dropDownMenuItems;
  String currentClass;

  @override
  void initState() {
    dropDownMenuItems = getDropDownMenuItems();
    currentClass = dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (Classes cls in classList.classes) {
      items.add(
          new DropdownMenuItem(
            value: cls.name,
            child: new Text(cls.name, style: TextStyle(color: Colors.white, fontSize: 16.0,)),
          ));
    }
    return items;
  }

  void changedDropDownItem(String selectedClass) {
    setState(() {
      currentClass = selectedClass;
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
              Text("Class: ", style: TextStyle(color: Colors.white, fontSize: 18.0),),
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.black,
                  splashColor: Color(0xFF1D1D1D),
                ),
                child: DropdownButton(value: currentClass, items: dropDownMenuItems, onChanged: changedDropDownItem, iconSize: 35.0,),),
              IconButton(icon: Icon(Icons.info_outline, color: Colors.white,), onPressed: null)
            ],
          )
        ],
      ),
    );
  }
}

