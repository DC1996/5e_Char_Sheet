import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

import 'GlobalVariables.dart';

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
              fontWeight: FontWeight.bold,
            ),
          ),
          new Text('$charClass  $classLevel'),
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
    storage.readData(widget.title).then((String currentText) {
      setState(() {
        _controller.text = currentText;
      });
    });
    _textFocus.addListener(onChange);
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
                fontWeight: FontWeight.bold,
              ),
            ),
            new TextField(
              textAlign: TextAlign.center,
              onChanged: writeSetText,
              controller: _controller,
              keyboardType: TextInputType.multiline,
              style: new TextStyle(
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
    bool hasFocus = _textFocus.hasFocus;
  }

  Future<File> writeSetText(String text) {
    return storage.writeData(widget.title, text);
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
    storage.readData(widget.title).then((String currentText) {
      setState(() {
        _controller.text = currentText;
      });
    });
    _textFocus.addListener(onChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(3.0, 1.0, 3.0, 2.0),
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(6.0),
        color: Color(0xFFececec),
      ),
      child:
        new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text('${widget.title}',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 1.5)),
            new TextField(
              controller: _controller,
              onChanged: writeSetText,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: new TextStyle(
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
    bool hasFocus = _textFocus.hasFocus;
  }

  Future<File> writeSetText(String text) {
    return storage.writeData(widget.title, text);
  }
}