import 'package:flutter/material.dart';
import 'package:char_sheet_5e/auto_size_text.dart';

class StatsInfo extends StatefulWidget {
  @override
  _StatsInfoState createState() => _StatsInfoState();
}

class _StatsInfoState extends State<StatsInfo> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.975,
      margin: EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
          border: new Border.all(
            //color: Colors.grey,
            width: 2.0,
          ),
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.0)
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
         new InfoContainer(16, "Armor Class", 0.25, 0.13, Color(0x0FF0940AA), 12.5, 38.0),
         new InfoContainer(21, "HP", 0.27, 0.15, Color(0xFF8B0000), 22.0, 42.0),
         new InfoContainer(4, "Initiative", 0.25, 0.13, Color(0xFF0B6623), 12.5, 38.0)
       ],
      ),
    );
  }
}

class InfoContainer extends StatefulWidget {
  final int value;
  final double w;
  final double h;
  final String desc;
  final double size;
  final double tsize;
  final Color color;

  InfoContainer(this.value, this.desc, this.w, this.h, this.color, this.size, this.tsize);

  @override
  _InfoContainerState createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * widget.h,
      width: MediaQuery.of(context).size.width * widget.w,
      margin: EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
      decoration: BoxDecoration(
          border: Border.all(color: widget.color, width: 2.0,),
          //boxShadow: [BoxShadow(color: widget.color, spreadRadius: 0.5, blurRadius: 1.5)],
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text(widget.desc, style: TextStyle(color: Colors.black, fontSize: widget.size, ), ),
            ],
          ),
          new AutoSizeText(widget.value.toString(), presetFontSizes: [46.0, 42.0], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold ),)
        ],
      ),
    );
  }
}



