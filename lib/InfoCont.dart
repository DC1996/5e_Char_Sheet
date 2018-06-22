import 'package:flutter/material.dart';
// #INFORAMTION CONTAINER

class InfoCont extends StatelessWidget {

  final String imagePath;
  final String value;
  InfoCont(this.imagePath, this.value);

  //BUDE TREBA WRAPNÚŤ CELY CONTAINER DO GestureDetector-u neskôr keď budeme robiť na funkcionalite

  @override
  Widget build(BuildContext context) {
    return new Container( //alignment: Alignment.centerRight,
        margin: new EdgeInsets.fromLTRB(
            0.1,
            2.3,
            1.0,
            4.5),
        width: (MediaQuery.of(context).size.width - 126.6)/2, // screen width - ( image width + paddings)
        height: 63.3,
        //STYLING ----------------------------------------
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Colors.black,
            width: 4.0,
          ),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(12.0),
        ),
        // CONTENT ---------------------------------------
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Expanded(
                child: new Center(
                    child: new Image.asset(imagePath)
                )
            ),
            new Expanded(
                child: new Center(
                  child: new Text(value,
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                )
            ),
          ],
        )
    );
  }
}
