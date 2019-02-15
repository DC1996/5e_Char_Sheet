import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:char_sheet_5e/AppDrawer.dart';
import 'package:char_sheet_5e/Widgets/Home/AbilityTable.dart';
import 'package:char_sheet_5e/Widgets/Home/SkillsTable.dart';
import 'package:char_sheet_5e/Widgets/Home/AvatarInfo.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    //set device orientation explicitly
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new Scaffold(
        resizeToAvoidBottomPadding: false, //prevents the widgets from resizing after keyboard pops up
        backgroundColor: Color(0xFF1D1D1D),
        //App Drawer -------------------------
        drawer: appDrawer,
        //App Bar ----------------------------
        appBar: PreferredSize(child: new AppBar(
          backgroundColor: Color(0xFF030303),
          iconTheme: new IconThemeData(color: Color(0xFFececec)),
          title: new GestureDetector(
            ///TRY TO FIX THE FOCUS ISSUE AT SOME POINT or re-inplement the input
            onLongPress: () => changeName(context),
            child: new Text(data.character.charName),
          ),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.settings, color: Colors.white),
                onPressed: () => Navigator.of(context).pushNamed('/CreatorPage')),
            new IconButton(icon: new Icon(Icons.settings, color: Colors.white),
                onPressed: () => Navigator.of(context).pushNamed('/ChangeCharacterPage')),
          ],
        ), preferredSize: Size.fromHeight(44.0)),
        //App Body ---------------------------
        body: new Column(
                    children: <Widget>[
                      new AvatarInfo(),
                      new Container(
                            width: MediaQuery.of(context).size.width * 0.975,
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: PageView(
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              children: <Widget>[
                                new CharacterAbilityTable(),
                                new SkillsTable(),
                                //new CharacterAbilityTable(),
                              ],
                            ),
                          ),
                    ],
                  ),

    );
  }

  Future changeName(BuildContext context) async { //changes the character name
    showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          title: new Text('Character Name'),
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
              ),
              controller: TextEditingController(text: AppDataManager.of(context).character.charName),
              autocorrect: false,
              onSubmitted: (String name) => Navigator.of(context).pop(AppDataManager.of(context).changeName(name)),
            ),
          ],
        )
    );
  }

}
