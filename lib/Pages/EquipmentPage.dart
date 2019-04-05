import 'package:flutter/material.dart';

import 'package:char_sheet_5e/JsonModels/Character_model.dart';

import 'package:char_sheet_5e/Widgets/Character/charPageTextCont.dart';
import 'package:char_sheet_5e/Widgets/Home/AvatarInfo.dart';
import 'package:char_sheet_5e/App_Data_Manager.dart';

class EquipmentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);

    return new Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        iconTheme: new IconThemeData(color: Color(0xFFececec)),
        title: new Text("Inventory"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.settings, color: Colors.white),
              onPressed:() => Navigator.of(context).pushNamed("/ChangeValues")),
        ],
      ),

      backgroundColor: Color(0xFF1D1D1D),
      body: new SafeArea(
        child: ListView(
          children: <Widget>[
            TextCont("Contents", data.character.charInventory, 9),
          ],
        ),
      ),
    );
  }

}
