import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';
import 'dart:async';

import 'package:char_sheet_5e/Pages/HomePage.dart';
import 'package:char_sheet_5e/Pages/CombatPage.dart';
import 'package:char_sheet_5e/Pages/CharacterPage.dart';
import 'package:char_sheet_5e/Pages/CreatorPage.dart';

import 'App_Data_Manager.dart';

class Application extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState state = AppDataManager.of(context);

    var asyncLoader = new AsyncLoader(
        initState: () async => await state.loadCharacterData(),
        renderLoad: () => new CircularProgressIndicator(),
        renderError: ([error]) => new Text('Sorry, there was an error loading your joke'),
        renderSuccess: ({data}) => new HomePage(),
    );

    return new MaterialApp(
        title: 'D&D 5e Char-Sheet', //title when we switch apps in OS
        color: Colors.black, //the color of the panel
        initialRoute: "/",
        routes: <String, WidgetBuilder> { //routes to navigate our app
          "/": (BuildContext context) => asyncLoader,
          "/CharacterPage": (BuildContext context) => new CharacterPage(),
          "/EquipmentPage": (BuildContext context) => new CharacterPage(),
          "/CreatorPage": (BuildContext context) => new CreatorPage(),
          "/SpellsPage": (BuildContext context) => new WeaponsPage(),
        }
    );
  }

}
