import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final String charName = 'Character Name';
  final int charHP = 10;

  @override
  Widget build(BuildContext context) {
    //the background of the app's home screen
    return new Scaffold(
      backgroundColor: Color(0xFFc6c6c6),
      //App Drawer ------------------------
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new Text('Character'),
            new Text('Weapons'),
            new Text('...'),
          ],
        ),
      ),
      //App Bar ----------------------------
      appBar: new AppBar(
        backgroundColor: Color(0xFF383232),
        iconTheme: new IconThemeData(color: Color(0xFFc6c6c6)),
        title: new FlatButton(
            onPressed: null,
            child: new Text(charName,
              style: new TextStyle(
                fontSize: 20.0,
                color: Color(0xFFc6c6c6),
              ),
            ),
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.folder, color: Color(0xFFc6c6c6)), onPressed: null),
          new IconButton(icon: new Icon(Icons.settings,color: Color(0xFFc6c6c6)), onPressed: null),
        ],
      ),
      //App Body ---------------------------
      body: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //container for the character Image -> it's in a container so we can resize it and add style
              new Container(
                margin: new EdgeInsets.all(12.0),
                width: 85.0,
                height: 130.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(8.0),
                  image: new DecorationImage(
                    image: new ExactAssetImage('images/char_Image.png'),
                  ),
                ),
              ),
            ],
          ),
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.all(12.0),
                    width: MediaQuery.of(context).size.width - 133.0, // screen width - ( image width + paddings)
                    height: 53.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(10.0),
                      color: Colors.red,
                    ),
                    child: new Center(
                      child: new Text(
                        'HP: ${charHP.toString()}',
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        //alignment: Alignment.centerRight,
                        margin: new EdgeInsets.all(12.0),
                        width: (MediaQuery.of(context).size.width - 157.0)/2, // screen width - ( image width + paddings)
                        height: 53.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: new BorderRadius.circular(8.0),
                          image: new DecorationImage(
                            image: new ExactAssetImage('images/Init.png'),
                            alignment: Alignment.bottomLeft,
                          ),
                        ),
                        child: new Text(
                            '3',
                            textAlign: TextAlign.right,
                            style: new TextStyle(
                              //wordSpacing: -0.8,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                        )
                      ),
                    ],
                  ),
                  new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Container(
                        alignment: Alignment.bottomLeft,
                        margin: new EdgeInsets.all(12.0),
                        width: (MediaQuery.of(context).size.width - 157.0)/2, // screen width - ( image width + paddings)
                        height: 53.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: new BorderRadius.circular(8.0),
                          image: new DecorationImage(
                            image: new ExactAssetImage('images/shield.png'),
                            alignment: Alignment.bottomLeft,
                          ),
                        ),
                        child: new Center(
                          child: new Text(
                            'HP: ${charHP.toString()}',
                            style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )

        ],
      ),
    );
  }

}
