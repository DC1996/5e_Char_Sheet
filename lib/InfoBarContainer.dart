import 'package:flutter/material.dart';
import 'Styling.dart' as style;
// #INFORAMTION CONTAINER

class InfoBarContainer extends StatelessWidget {

  final String imagePath;
  InfoBarContainer(this.imagePath);

  //BUDE TREBA WRAPNÚŤ CELY CONTAINER DO GestureDetector-u neskôr keď budeme robiť na funkcionalite

  @override
  Widget build(BuildContext context) {
    return new Container( //alignment: Alignment.centerRight,
        margin: new EdgeInsets.all(6.0),
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.07,
        //STYLING ----------------------------------------
        decoration: new BoxDecoration(
          boxShadow: [style.blackShadow],
          border: new Border.all(
            color: Colors.black,
            width: 4.0,
          ),
          color: Color(0xFFececec),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
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
          ],
        )
    );
  }
}
