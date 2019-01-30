import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';

import 'package:char_sheet_5e/Pages/HomePage.dart';
import 'package:char_sheet_5e/Pages/CombatPage.dart';
import 'package:char_sheet_5e/Pages/CharacterPage.dart';
import 'package:char_sheet_5e/Pages/CreatorPage.dart';

import 'App_Data_Manager.dart';

class Application extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);

    //shows loading screen while reading database & character data
    var charDataLoader = new AsyncLoader(
        initState: () async => await data.loadCharacterData(),
        renderLoad: () => new CircularProgressIndicator(),        ///CHANGE
        renderError: ([error]) => new Text('Error: Loading character data failed.'),
        renderSuccess: ({data}) => new HomePage(),
    );

    var spellListLoader = new AsyncLoader(
      initState: () async => await data.loadSpells(),
      renderLoad: () => new CircularProgressIndicator(), ///CHANGE
      renderError: ([error]) => new Text('Error: Loading spells failed.'),
      renderSuccess: ({data}) => new WeaponsPage(),
    );

    var creatorLoader = new AsyncLoader(
      initState: () async => await data.loadCreator(),
      renderLoad: () => new CircularProgressIndicator(), ///CHANGE
      renderError: ([error]) => new Text('Error: Loading the creator failed.'),
      renderSuccess: ({data}) => new CreatorPage(),
    );

    return new MaterialApp(
        title: 'D&D 5e Char-Sheet', //title when we switch apps in OS
        color: Colors.black, //the color of the panel
        initialRoute: "/",
        routes: <String, WidgetBuilder> { //routes to navigate our app
          "/": (BuildContext context) => charDataLoader,
          "/CharacterPage": (BuildContext context) => new CharacterPage(),
          "/EquipmentPage": (BuildContext context) => new CharacterPage(),
          "/CreatorPage": (BuildContext context) => creatorLoader,
          "/SpellsPage": (BuildContext context) => spellListLoader,
        }
    );
  }

}
