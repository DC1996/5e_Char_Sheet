import 'package:flutter/material.dart';
// #INFORAMTION CONTAINER

class InfoCont2 extends StatelessWidget {

  final String imagePath;
  final String value;
  InfoCont2(this.imagePath, this.value);

  //BUDE TREBA WRAPNÚŤ CELY CONTAINER DO GestureDetector-u neskôr keď budeme robiť na funkcionalite

  @override
  Widget build(BuildContext context) {
    return new Container( //alignment: Alignment.centerRight,
        margin: new EdgeInsets.all(6.0),
        width: MediaQuery.of(context).size.width * 0.2, // screen width - ( image width + paddings)
        height: MediaQuery.of(context).size.height * 0.09,
        //STYLING ----------------------------------------
        decoration: new BoxDecoration(
          boxShadow: [new BoxShadow(
            color: Colors.black,
            blurRadius: 8.0,
          )],
          border: new Border.all(
            color: Colors.black,
            width: 4.0,
          ),
          color: Color(0xFFececec),
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
