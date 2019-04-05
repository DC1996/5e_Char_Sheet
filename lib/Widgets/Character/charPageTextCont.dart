import 'package:flutter/material.dart';
import 'package:char_sheet_5e/App_Data_Manager.dart';

class TextCont extends StatefulWidget {
  final title;
  final text;
  final i;

  TextCont(this.title, this.text, this.i);

  @override
  _TextContState createState() => _TextContState();
}

class _TextContState extends State<TextCont> {
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    _controller.text = widget.text;
    _controller.addListener(_onChanged);
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.topCenter,
      margin: new EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.5),
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.white,
          width: 2.0,
        ),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(6.0),
        color: Colors.white,
      ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text('${widget.title}',
              style: new TextStyle(
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            new TextField(
              textAlign: TextAlign.start,
              controller: _controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: new TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
              decoration: new InputDecoration(
                border: InputBorder.none,
                contentPadding: new EdgeInsets.only(top: 2, bottom: 1, left: 5, right: 5)
              ),
            ),
          ],
        ),
    );
  }

  void _onChanged() {
    AppDataManager.of(context).changeInfo(_controller.text, widget.i);
  }

}