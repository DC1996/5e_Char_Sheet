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
                      "Components: ${spellList[i].spellComponents}",
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Padding(padding: EdgeInsets.all(0.6)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${spellList[i].spellClasses}",
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

  Widget _buildCharSpells(List<Spell> spellList) {
      return new ListView.builder(
          itemCount: spellList.length,
          itemBuilder: (context, i) {
            return new GestureDetector(
              onTap: () => showDialog(
                  context: context, builder: (context) => CharSpellInfo(i)),
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
                        "Components: ${spellList[i].spellComponents}",
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Padding(padding: EdgeInsets.all(0.6)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "${spellList[i].spellClasses}",
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
    return new DefaultTabController(
        length: 2,
        child: Scaffold(
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
              bottom: TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Text("Your Spells"),
                    ),
                    Tab(
                      child: Text("Spellbook"),
                    ),
                  ]),
            ),
            body: TabBarView(children: [
              new SafeArea(
                  child: GestureDetector(
                onTap: () =>
                    FocusScope.of(context).requestFocus(new FocusNode()),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      color: Colors.black,
                      child: data.character.charSpells.isNotEmpty
                          ? _buildCharSpells(data.character.charSpells)
                          : Center(
                              child: Text("Add some spells", style: TextStyle(color: Colors.white, fontSize: 30),),
                            ),
                    ))
                  ],
                ),
              )), // 1st Tab Your Spells
              new SafeArea(
                  child: GestureDetector(
                onTap: () =>
                    FocusScope.of(context).requestFocus(new FocusNode()),
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
              )), // 2nd Tab Spellbook
            ])));
  }
}

///this needs attention afterwards!!!
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
    AppDataManagerState data = AppDataManager.of(context);

    Spell spell = data.searchSpells.length != 0 ? data.searchSpells[i] : data.filterSpells[i];
    bool contains = false;

    if(data.character.charSpells.isNotEmpty) {
      for(int i = 0; i < data.character.charSpells.length; i++) {
        if (data.character.charSpells[i].name == spell.name) {
          contains = true;
          break;
        }
      }
    }

    StringBuffer desc = StringBuffer();
    StringBuffer highdesc = StringBuffer();
    if (data.searchSpells.isEmpty) {
      for (int u = 0; u < data.filterSpells[i].desc.length; u++) {
        desc.write(data.filterSpells[i].desc[u]);
      }
    } else {
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
    } else if (data.searchSpells[i].higher_level != null) {
      for (int u = 0; u < data.searchSpells[i].higher_level.length; u++) {
        highdesc.write(data.searchSpells[i].desc[u]);
      }
    }

    return new SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
                '${data.searchSpells.length != 0 ? data.searchSpells[i].name : data.filterSpells[i].name}'),
            contains
                ?
            new IconButton(
                icon: Icon(Icons.check),
                color: Colors.green,
                iconSize: 35,
                onPressed: () => {})
                :
            IconButton(
                icon: Icon(Icons.add),
                iconSize: 35,
                color: Colors.black,
                onPressed:
                    () => data.addSpell(data.searchSpells.length != 0
                    ? data.searchSpells[i]
                    : data.filterSpells[i])),
          ]),
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Range: ${data.searchSpells.length != 0 ? data.searchSpells[i].range : data.filterSpells[i].range}',
                maxLines: null,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
              ),
              Padding(padding: EdgeInsets.all(2)),
              Text(
                'Casting time: ${data.searchSpells.length != 0 ? data.searchSpells[i].casting_time : data.filterSpells[i].casting_time}',
                maxLines: null,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
              ),
              Padding(padding: EdgeInsets.all(2)),
              Text(
                'Duration: ${data.searchSpells.length != 0 ? data.searchSpells[i].duration : data.filterSpells[i].duration}',
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
              horizontal: MediaQuery.of(context).size.width * 0.05),
        ),
      ],
    );
  }
}

class CharSpellInfo extends StatelessWidget {
  final int i;

  CharSpellInfo(this.i);

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    try {
      return new SimpleDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${data.character.charSpells[i].name}'),
              IconButton(
                  icon: Icon(Icons.remove),
                  iconSize: 35,
                  color: Colors.black,
                  onPressed: () => Navigator.of(context)
                      .pop(data.removeSpell(data.character.charSpells[i]))),
            ]),
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Range: ${data.character.charSpells[i].range}',
                  maxLines: null,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                ),
                Padding(padding: EdgeInsets.all(2)),
                Text(
                  'Casting time: ${data.character.charSpells[i].casting_time}',
                  maxLines: null,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                ),
                Padding(padding: EdgeInsets.all(2)),
                Text(
                  'Duration: ${data.character.charSpells[i].duration}',
                  maxLines: null,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                ),
                Padding(padding: EdgeInsets.all(2)),
                Text(
                  'Description: ${data.character.charSpells[i].description}',
                  maxLines: null,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                ),
                Padding(padding: EdgeInsets.all(2)),
                Text(
                  'Higher Level: ${data.character.charSpells[i].higherLevel}',
                  maxLines: null,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                ),
                Padding(padding: EdgeInsets.all(2)),
              ],
            ),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
          ),
        ],
      );
    } catch (e) {
      print("UFF");
    }
  }
}
