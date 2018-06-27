import 'package:flutter/material.dart'; //package pre widgety
import 'package:flutter/services.dart'; //package pre dalšie funkcie
import 'CustomAppBar.dart'; //náš appBar
import 'AppDrawer.dart'; //zobrazenie riadka v drawer-i
import 'BaseCharStats.dart'; //horná časť home page-u
import 'InfoBar.dart'; // tie 4 kolonky nad Ability taublkou
import 'AbilityHeader.dart'; //hlavička pre ability table
import 'AbilityTable.dart'; //zobrazenie abilít

//toto je vlastne čo vidíme v appke
//TOTO BUDEME MUSIEŤ PREROBIŤ NA STATEFUL aby sme mohli meniť veci podla inputu...
//ALE až NESKOR keď sa bude riesiť funkčnosť ;)
class HomePage extends StatelessWidget {

  final int charHP = 10;

  @override
  Widget build(BuildContext context) {
    //blokuje otáčanie obrazovky
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //hlavná obrazovka
    return new Scaffold(
      backgroundColor: Color(0xFFefefef),
      //App Drawer -------------------------
      drawer: AppDrawer,
      //App Bar ----------------------------
      appBar: CustomAppBar,
      //App Body ---------------------------
      body: new SafeArea(   //
          child: new Column(
            children: <Widget>[
              new BaseCharStats(), //obrazok, HP, Initiative, armor Class
              new InfoBar(), //4 kolonky pred tabulkou
              new AbilityHeader(),
              new AbilityTable(),
            ],
          )
      ),
    );
  }

}
