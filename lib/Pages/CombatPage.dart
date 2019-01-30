import 'package:flutter/material.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';


class WeaponsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    return new Scaffold(
      resizeToAvoidBottomPadding: false,

      appBar: new AppBar(
        backgroundColor: Color(0xFF030303),
        iconTheme: new IconThemeData(color: Color(0xFFececec)),
        title: new GestureDetector(
          child: new Text("List of Spells",
            textAlign: TextAlign.left,
            maxLines: 2,
            style: new TextStyle(
              fontSize: 20.0,
              color: Color(0xFFececec),
            ),
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.folder, color: Color(0xFFececec)),
              onPressed: null),
          new IconButton(icon: new Icon(Icons.settings, color: Color(0xFFececec)),
              onPressed: null),
        ],
      ),

      body: new SafeArea(child: Column(
        children: <Widget>[
          Expanded(child: Container(
                color: Colors.black,
                child: ListView.builder (
                    itemCount: data.spellBook.spells.length,
                    itemBuilder: (BuildContext ctxt, int i) {
                      return new Container(
                          //height: MediaQuery.of(context).size.height * 0.1,
                          //width: MediaQuery.of(context).size.width * 0.9,
                          margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
                          padding: EdgeInsets.all(7.5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${data.spellBook.spells[i].name}", style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),),
                              Text("Spell level: ${data.spellBook.spells[i].level.toString()}"),
                              Text("Components: ${data.spellBook.spells[i].components}"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                Text("${data.spellBook.spells[i].classes[0].name}"),
                                Text("${data.spellBook.spells[i].casting_time}", style: TextStyle(fontStyle: FontStyle.italic),),
                              ],)
                            ],
                          ));
                    }
                ),
              ))
        ],
      ))
    );
  }

}
