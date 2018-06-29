import 'package:flutter/material.dart';
import 'dart:ui' hide TextStyle;
import 'dart:async';

import 'package:image_picker/image_picker.dart';

import 'Styling.dart' as style;
import 'HomePage.dart';

// ---- GLOBAL VARIABLES ----
String charImage;
String imagePath = "images/char_Image.png";
String charClass = "Char_Class";
int classLevel = 0;

class CharImage extends StatefulWidget {

  @override
  CharImageState createState() => CharImageState();
}

//class database
enum Classes{Barbarian,Bard,Cleric,Druid,Fighter,Monk,Paladin,Ranger,Rogue,Sorcerer,Warlock,Wizard,}

class CharImageState extends State<CharImage> {

  String value = '';

  void setValue(String newValue) => setState(() => value = newValue);


  @override
  void initState() {
    charImage = imagePath;
  }
  /*                                                              *
  * Treba opravit nejako ten text...                              *
  * netusim ako nastavit text aby sa nerozdeloval na viac riadkov *
  * Texty su na riadkoch 84 a 104                                 *
  *                                                               */



  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      //onTap: displayCharClass,
      onLongPress: getImage,
      child: new Container(
        margin: new EdgeInsets.fromLTRB(4.6, 8.6, 5.0, 4.6),
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Colors.black,
            width: 4.0,
          ),
          boxShadow: [style.blackShadow],
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(6.0),
          image: new DecorationImage(
            image: new ExactAssetImage(charImage),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: new ClipRect(
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new Row(
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.17,
                  height: 20.0,
                  decoration: new BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.25)
                  ),
                  child: new FlatButton(
                    onPressed: displayCharClass,
                    child: new Text(
                    '$charClass',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                    ),
                  ),)

                ),
                new Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.08,
                  height: 20.0,
                  decoration: new BoxDecoration(
                      color: Colors.red.shade200.withOpacity(0.25)
                  ),
                  child: new FlatButton(
                    onPressed: displayCharLevel,
                    child: new Text(
                    '${classLevel.toString()}',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                    ),
                  ),)

                ),
              ],
            ),
            /*child: new Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.25,
              height: 20.0,
              decoration: new BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.25)
              ),
              child: new Text(
                '$charClass ${classLevel.toString()}',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),*/
          ),
        ),
      ),
    );
  }

  // ---- STATE CHANGING FUNCTIONS ----
  void setCharClass(String newClass) {
    setState(() {
      charClass = newClass;
    });
    //Navigator.pop(context);

  }

  void setClassLevel(String newLevel) {
    setState(() {
      classLevel = int.tryParse(newLevel);
    });
  }



  // ---- FUNCTIONALITY FUNCTIONS ----
  Future displayCharClass() async {
    switch(// zobrazime staty charaktera
    await showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          title: new Text("$charName's Information"),
          children: <Widget>[
            new Column(
              children: <Widget>[
                /*new TextField(
                  decoration: new InputDecoration(
                    labelText: 'Character Class',
                    hintText: charClass,
                  ),
                  onSubmitted: setCharClass,
                  onChanged: setCharClass,
                ),*/ //List class database
                new SimpleDialogOption(child: new Text('Barbarian'), onPressed: (){Navigator.pop(context, Classes.Barbarian);},),
                new SimpleDialogOption(child: new Text('Bard'), onPressed: (){Navigator.pop(context, Classes.Bard);},),
                new SimpleDialogOption(child: new Text('Cleric'), onPressed: (){Navigator.pop(context, Classes.Cleric);},),
                new SimpleDialogOption(child: new Text('Druid'), onPressed: (){Navigator.pop(context, Classes.Druid);},),
                new SimpleDialogOption(child: new Text('Fighter'), onPressed: (){Navigator.pop(context, Classes.Fighter);},),
                new SimpleDialogOption(child: new Text('Monk'), onPressed: (){Navigator.pop(context, Classes.Monk);},),
                new SimpleDialogOption(child: new Text('Paladin'), onPressed: (){Navigator.pop(context, Classes.Paladin);},),
                new SimpleDialogOption(child: new Text('Ranger'), onPressed: (){Navigator.pop(context, Classes.Ranger);},),
                new SimpleDialogOption(child: new Text('Rogue'), onPressed: (){Navigator.pop(context, Classes.Rogue);},),
                new SimpleDialogOption(child: new Text('Sorcerer'), onPressed: (){Navigator.pop(context, Classes.Sorcerer);},),
                new SimpleDialogOption(child: new Text('Warlock'), onPressed: (){Navigator.pop(context, Classes.Warlock);},),
                new SimpleDialogOption(child: new Text('Wizard'), onPressed: (){Navigator.pop(context, Classes.Wizard);},),

                /*new TextField(
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(
                    labelText: 'Class Level',
                    hintText: classLevel.toString(),
                  ),
                  onSubmitted: setClassLevel,
                  onChanged: setClassLevel,
                ),*/
                new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Done')),
              ],
            ),
          ],
        )
    )
    ){
      //switch cases = asign choice to charClass
      case Classes.Barbarian:
        setCharClass('Barbarian');
        break;
      case Classes.Bard:
        setCharClass('Bard');
        break;
      case Classes.Cleric:
        setCharClass('Cleric');
        break;
      case Classes.Druid:
        setCharClass('Druid');
        break;
      case Classes.Fighter:
        setCharClass('Fighter');
        break;
      case Classes.Monk:
        setCharClass('Monk');
        break;
      case Classes.Paladin:
        setCharClass('Paladin');
        break;
      case Classes.Ranger:
        setCharClass('Ranger');
        break;
      case Classes.Rogue:
        setCharClass('Rogue');
        break;
      case Classes.Sorcerer:
        setCharClass('Sorcerer');
        break;
      case Classes.Warlock:
        setCharClass('Warlock');
        break;
      case Classes.Wizard:
        setCharClass('Wizard');
        break;

    }
  }

  Future displayCharLevel() async {
    await showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          title: new Text("$charName's Information"),
          children: <Widget>[
                new TextField(
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(
                    labelText: 'Class Level',
                    hintText: classLevel.toString(),
                  ),
                  onSubmitted: setClassLevel,
                  onChanged: setClassLevel,
                ),
                new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Done')),
          ],
        ),
    );
  }

  //---- CHANGING THE CHARACTER'S IMAGE ----
  Future getImage() async {
    var newImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      charImage = newImage.path;
    });
  }
}