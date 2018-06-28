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

class CharImageState extends State<CharImage> {

  @override
  void initState() {
    charImage = imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: displayCharStats,
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
            child: new Container(
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
            ),
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
  Future displayCharStats() async { // zobrazime staty charaktera
    await showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
          title: new Text("$charName's Information"),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(
                    labelText: 'Character Class',
                    hintText: charClass,
                  ),
                  onSubmitted: setCharClass,
                  onChanged: setCharClass,
                ),
                new TextField(
                  keyboardType: TextInputType.number,
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
          ],
        )
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