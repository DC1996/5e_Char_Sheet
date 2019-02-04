import 'package:flutter/material.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';
import 'package:char_sheet_5e/JsonModels/Spells_model.dart';

class SpellsPage extends StatefulWidget {
  @override
  SpellsPageState createState() => SpellsPageState();
}

class SpellsPageState extends State<SpellsPage> {
  TextEditingController controller = TextEditingController();

  //---------------------------------------------------------------------------
  //BULLSHIT FUNCTION TO ITERATE THROUGH CLASSES THAT CAN CAST THAT SPELL
  //YEAH JUST FUCkING SPLENDID
  String _spellClassList(List<SpellClass> spellClasses) {
    StringBuffer theShit = StringBuffer();
    String delim = "/";
    for (var i = 0; i < spellClasses.length; i++) {
      if (i > 0) {
        theShit.write(delim);
        theShit.write(spellClasses[i].name);
      } else
        theShit.write(spellClasses[i].name);
    }
    return theShit.toString();
  }

  Widget _buildSpellList(List<Spell> spellList) {
    return new ListView.builder(
        itemCount: spellList.length,
        itemBuilder: (context, i) {
          return new GestureDetector(
            onTap: () => showDialog(
                context: context, builder: (context) => SpellInfo(i)),
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
                padding: EdgeInsets.all(7.5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${spellList[i].name}",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${spellList[i].level == 0 ? "Cantrip" : spellList[i].level == 1 ? "${spellList[i].level.toString()}st level spell" : spellList[i].level == 2 ? "${spellList[i].level.toString()}nd level spell" : spellList[i].level == 3 ? "${spellList[i].level.toString()}rd level spell" : "${spellList[i].level.toString()}th level spell"}",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(0.8)),
                    Text(
                      "Components: ${spellList[i].components}",
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Padding(padding: EdgeInsets.all(0.6)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${_spellClassList(spellList[i].classes)}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${spellList[i].casting_time}",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          backgroundColor: Color(0xFF030303),
          iconTheme: new IconThemeData(color: Color(0xFFececec)),
          title: TextField(
            onChanged: (value) {
              data.onSpellSearchTextChanged(value);
            },
            style: TextStyle(color: Colors.white),
            controller: controller,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              hintText: "Search by spell name...",
            ),
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.filter_list, color: Color(0xFFececec)),
              onPressed:
                  null, //() => showDialog(context: context, builder: (context) => FilterDialog())
            ),
          ],
        ),
        body: new SafeArea(
            child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                    color: Colors.black,
                    child: data.searchSpells.length != 0 ||
                            controller.text.isNotEmpty
                        ? _buildSpellList(data.searchSpells)
                        : data.filterSpells.length != 0
                            ? _buildSpellList(data.filterSpells)
                            : _buildSpellList(data.spellList)),
              )
            ],
          ),
        )));
  }
}

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    return new SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: Center(child: Text("Filter Spells")),
      children: <Widget>[
        DropdownButton(
          items: data.classList.classes.map((clas) {
            return DropdownMenuItem<String>(
                child: Text(clas.name), value: clas.name);
          }).toList(),
          value: data.character.charClass.className,
          onChanged:
              null, //(String newName) => data.onSpellFilterChange(newName, true)
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 5.0),
          padding: EdgeInsets.all(5.0),
          //child:
        ),
        //FlatButton(onPressed: spellsKey.currentState.onSpellFilterChange("RESET", true), child: Text("RESET"))
      ],
    );
  }
}

class SpellInfo extends StatelessWidget {
  final int i;

  SpellInfo(this.i);

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);

    StringBuffer desc = StringBuffer();
    StringBuffer highdesc = StringBuffer();
    if (data.searchSpells.isEmpty) {
      for (int u = 0; u < data.filterSpells[i].desc.length; u++) {
        desc.write(data.filterSpells[i].desc[u]);
      }
    }
    else {
      for (int u = 0; u < data.searchSpells[i].desc.length; u++) {
        desc.write(data.searchSpells[i].desc[u]);
      }
    }

    if (data.searchSpells.isEmpty) {
      if (data.filterSpells[i].higher_level != null) {
        for (int u = 0; u < data.filterSpells[i].higher_level.length; u++) {
          highdesc.write(data.filterSpells[i].desc[u]);
        }
      }
    }
    else if (data.searchSpells[i].higher_level != null) {
      for (int u = 0; u < data.searchSpells[i].higher_level.length; u++) {
        highdesc.write(data.searchSpells[i].desc[u]);
      }
    }


      return new SimpleDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)),
        title: Center(
            child: Text('${data.searchSpells.length != 0
                ? data.searchSpells[i].name
                : data.filterSpells[i].name}')),
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Range: ${data.searchSpells.length != 0 ? data.searchSpells[i]
                      .range : data.filterSpells[i].range}',
                  maxLines: null,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                ),
                Padding(padding: EdgeInsets.all(2)),
                Text(
                  'Casting time: ${data.searchSpells.length != 0 ? data
                      .searchSpells[i].casting_time : data.filterSpells[i]
                      .casting_time}',
                  maxLines: null,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                ),
                Padding(padding: EdgeInsets.all(2)),
                Text(
                  'Duration: ${data.searchSpells.length != 0 ? data
                      .searchSpells[i].duration : data.filterSpells[i]
                      .duration}',
                  maxLines: null,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                ),
                Padding(padding: EdgeInsets.all(2)),
                Text(
                  'Description: ${desc.toString()}',
                  maxLines: null,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                ),
                Padding(padding: EdgeInsets.all(2)),
                Text(
                  'Higher Level: ${highdesc.length == 0 ? "--" : highdesc.toString()}',
                  maxLines: null,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                ),
                Padding(padding: EdgeInsets.all(2)),
              ],
            ),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery
                    .of(context)
                    .size
                    .width * 0.05),
          ),
        ],
      );
    }
  }
