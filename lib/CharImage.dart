import 'package:flutter/material.dart';
import 'dart:ui' hide TextStyle;
import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'Styling.dart' as style;
import 'package:char_sheet_5e/GlobalVariables.dart';
//import 'package:char_sheet_5e/Pages/HomePage.dart';

// ---- GLOBAL VARIABLES ----

class CharImage extends StatefulWidget {
  @override
  CharImageState createState() => CharImageState();
}

class CharImageState extends State<CharImage> {
  

  @override
  void initState() {
    super.initState();
  }

  /*                                                              *
  * Treba opravit nejako ten text...                              *
  * netusim ako nastavit text aby sa nerozdeloval na viac riadkov *
  * Texty su na riadkoch 84 a 104                                 *
  *                                                               */



  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: displayCharStats,
      onLongPress: writeGetImage,
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
            image: new ExactAssetImage(charImage ?? 'images/char_Image.png'),
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

  // ---- FUNCTIONALITY FUNCTIONS ----
  Future displayCharStats() async {
    await showDialog( context: context,
        builder: (_) => new ClassSelectDialog(),
    );
    writeUpdateClass(charClass);
  }

  Future<File> writeUpdateClass(String newClass) {
    print('$newClass');
    setState(() {
      charClass = newClass;
    });

    return storage.writeData('charClass', newClass);
  }

  //---- CHANGING THE CHARACTER'S IMAGE ----
  Future writeGetImage() async {
    File newImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      charImage = newImage.path;
    });

    return storage.writeData('charImage', newImage.path);
  }
}

class ClassSelectDialog extends StatefulWidget {

  @override
  ClassSelectDialogState createState() => ClassSelectDialogState();
}

class ClassSelectDialogState extends State<ClassSelectDialog> {

  @override
  void initState() {
    if(charClass == null) setState(() {
      charClass = charClasses.elementAt(0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      title: new Text("$charName's Information"),
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
                children: <Widget>[
                  new Text('Character Class: '),
                  new DropdownButton(
                    value: charClass,
                    items: charClasses.map((String usableClass){
                      return new DropdownMenuItem(
                          value: usableClass,
                          child: new Text(usableClass));
                    }).toList(),
                    onChanged: setCharClass,
                  )
                ]
            ),
            new TextField(
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(
                labelText: 'Class Level',
                hintText: classLevel.toString(),
              ),
              onSubmitted: writeClassLevel,
              onChanged: writeClassLevel,
            ),
          ],
        ),
        new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Save')),
        //tento navigotor.pop ti vlastne 'prenesie' charClass ktorý sa potom použije ako argument v updateClass
        //je to trocha divné no :D setClassLevel funguje ale setCharClass sa už neprenesie
      ],
    );
  }

  // ---- STATE CHANGING FUNCTIONS ----
  void setCharClass(newClass) {
    setState(() {
      charClass = newClass;
    });
  }

  void setClassLevel(String newLevel) {
    setState(() {
      classLevel = int.tryParse(newLevel);
    });
  }

  Future<File> writeClassLevel(String newClass) {
    setClassLevel(newClass);
    return storage.writeData('classLevel', int.tryParse(newClass));
  }

}
