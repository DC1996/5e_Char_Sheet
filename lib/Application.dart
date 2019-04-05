import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';

import 'package:char_sheet_5e/Pages/LoadingPage.dart';
import 'package:char_sheet_5e/Pages/HomePage.dart';
import 'package:char_sheet_5e/Pages/CharacterPage.dart';
import 'package:char_sheet_5e/Pages/SpellsPage.dart';
import 'package:char_sheet_5e/Pages/CreatorPage.dart';
import 'package:char_sheet_5e/Pages/ChangeCharacterPage.dart';
import 'package:char_sheet_5e/Pages/SettingsPage.dart';
import 'package:char_sheet_5e/Pages/EquipmentPage.dart';
import 'package:char_sheet_5e/Pages/WeaponsPage.dart';

import 'App_Data_Manager.dart';

class Application extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);

    //shows loading screen while reading database & character data
    var charDataLoader = new AsyncLoader(
        initState: () async => await data.loadApplicationDatabase(),
        renderLoad: () => new LoadingPage(),  ///CHANGE
        renderError: ([error]) => new Text('Error: Loading character data failed.'),
        renderSuccess: ({data}) => new HomePage(),
    );

    return new MaterialApp(
        title: 'D&D 5e Char-Sheet', //title when we switch apps in OS
        color: Colors.black, //the color of the panel
        initialRoute: "/",
        routes: <String, WidgetBuilder> { //routes to navigate our app
          "/": (BuildContext context) => charDataLoader,
          "/CharacterPage": (BuildContext context) => new CharacterPage(),
          "/EquipmentPage": (BuildContext context) => new EquipmentPage(), ///MORE MORE MORE///
          "/WeaponsPage": (BuildContext context) => new WeaponsPage(),
          "/ChangeValues": (BuildContext context) => new SettingsPage(),
          "/CreatorPage" : (BuildContext context) => new CreatorPage(),
          "/SpellsPage": (BuildContext context) => new SpellsPage(),
          "/ChangeCharacterPage" : (BuildContext context) => new ChangeCharacter(),
        }
    );
  }

}
