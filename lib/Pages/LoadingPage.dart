import 'package:flutter/material.dart';
import 'dart:math';

class LoadingPage extends StatelessWidget {
  final List<String> loadingQuotes = ["What do you call a mountaintop with a Rogue on it? \nA Sneak Peak.", "A human and an elf walk into a bar.\nThe halfling walks under it.", "Two elves walked into a bar.\nNow there's a Bar Elf sub-race.", "What do you call a mage duel?\nA spelling B.", "Why don't halflings plan for the future?\nBecause they're shortsighted...", "Why can't a fallen paladin walk straight?\nHe's out of alignment.", "Why do liches and vampires tend to speak in riddles?\nBecause they're CRYPTic.","Where do you find an Orc with no arms or legs?\nRight where you left him.","What does a Great Wyrm call a 20th-level monk?\nFast Food.", "What's the difference between an insane asylum and a band of dragon hunters?\nMagic swords.", "How many dwarfs does it take to screw in a new lantern? 13.\n 1 to hold it and 12 to drink booze till the room spins."];

  final _random = new Random();
  int next(int min, int max) {return min + _random.nextInt(max - min);}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(), //?????
          new Image.asset('images/5e-menu-logo.png',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          new Text("5th Edition Adventure Helper", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.032),),
          Padding(padding: EdgeInsets.symmetric(vertical: 15.0), child: Text(loadingQuotes[next(0, loadingQuotes.length)], style: TextStyle(color: Colors.white,), textAlign: TextAlign.center,)),
          CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),)
    ])
    );
  }
}
