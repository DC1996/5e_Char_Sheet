import 'package:flutter/material.dart';
import 'AttributeHeader.dart';
import 'AttributeRow.dart';

class AttributeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height - 216.0),
      width: MediaQuery.of(context).size.width,
      margin: new EdgeInsets.all(8.6),
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.black,
          width: 4.0,
          style: BorderStyle.solid,
        ),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      alignment: Alignment.topCenter,
      child: new Column(
        children: <Widget>[
          new AttributeHeader(),
          new AttributeRow('Strenght', '10', '+3', '+1'),
          new AttributeRow('Dexterity', '10', '+3', '+1'),
          new AttributeRow('Widsom', '10', '+3', '+1'),
          new AttributeRow('Inteligence', '10', '+3', '+1'),
          new AttributeRow('Constipation', '10', '+3', '+1'),
          new AttributeRow('Charisma', '10', '+3', '+1'),
        ],
      ),
    );
  }

}
