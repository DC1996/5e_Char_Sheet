import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:char_sheet_5e/App_Data_Manager.dart';
import 'package:char_sheet_5e/GlobalVariables.dart';

class ClassTextCont extends StatefulWidget {
  @override
  _ClassTextContState createState() => _ClassTextContState();
}

class _ClassTextContState extends State<ClassTextCont> {


  @override
  Widget build(BuildContext context) {
    return new Container(
      //alignment: Alignment.center,
      margin: new EdgeInsets.only(bottom: 1.5),
      width: MediaQuery.of(context).size.width * 0.6301,
      height: MediaQuery.of(context).size.height * 0.062,
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(6.0),
        color: Color(0xFFececec),
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Text('Class & Level',
            style: new TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          new Text('hehe',
            style: new TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}

class TextCont extends StatefulWidget {
  final title;

  TextCont(this.title);

  @override
  _TextContState createState() => _TextContState();
}

class _TextContState extends State<TextCont> {
  TextEditingController _controller = new TextEditingController();
  FocusNode _textFocus = new FocusNode();

  @override
  void initState() {
    _textFocus.addListener(onChange);
    _controller.addListener(onChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.topCenter,
      margin: new EdgeInsets.only(bottom: 1.5),
      width: MediaQuery.of(context).size.width * 0.6301,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(6.0),
        color: Color(0xFFececec),
      ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text('${widget.title}',
              style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            new TextField(
              textAlign: TextAlign.center,
              //onChanged: //writeSetText,
              controller: _controller,
              keyboardType: TextInputType.multiline,
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              decoration: new InputDecoration(
                contentPadding: new EdgeInsets.only(top: 0.0, bottom: 0.0)
              ),
            ),
          ],
        ),
    );
  }

  void onChange(){
    String newText = _controller.text;
    bool hasFocus = _textFocus.hasFocus;
    _controller.selection = new TextSelection(
        baseOffset: newText.length,
        extentOffset: newText.length
    );
  }


}

class GenTextCont extends StatefulWidget {
  final title;

  GenTextCont(this.title);

  @override
  _GenTextContState createState() => _GenTextContState();
}

class _GenTextContState extends State<GenTextCont> {
  TextEditingController _controller = new TextEditingController();
  FocusNode _textFocus = new FocusNode();

  String text;

  @override
  void initState() {
    _textFocus.addListener(onChange);
    _controller.text = AppDataManager.of(context).character.charPersonality;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 2.5, horizontal: 8.0),
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.white,
          width: 2.0,
        ),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(6.0),
        color: Colors.white,
      ),
      child:
        new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text('${widget.title}',
              style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 1.5)),
            new TextField(
              controller: _controller,
              onChanged: (String someString) => data.savePersinality(_controller.text),
              textAlign: TextAlign.start,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: new TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
    );
  }

  void onChange(){
    FocusScope.of(context).requestFocus(_textFocus);
  }
}