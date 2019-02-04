import 'package:flutter/material.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';
import 'package:char_sheet_5e/JsonModels/Alignments_model.dart';

class AlignmentPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    final int pos = data.alignmentList.alignment.indexWhere((char) =>  char.name == data.character.charAlignment);
    //get the current alignment to display the description of it

    return Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        padding: new EdgeInsets.fromLTRB(10.0, 5.0, 8.0, 5.0),
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Alignment:",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.black,
                    splashColor: Color(0xFF1D1D1D),
                  ),
                  child: DropdownButton(
                    value: data.character.charAlignment,
                    items: data.alignmentList.alignment.map((Alignments al) {
                      return new DropdownMenuItem<String>(
                        value: al.name,
                        child: Text(
                          al.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (String al) => data.changeAlignment(al),
                    iconSize: 35.0,
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) => AlignmentDescription(pos)))
              ],
            )
          ],
        ));
  }
}

class AlignmentDescription extends StatelessWidget {
  final int i;

  AlignmentDescription(this.i);

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: Center(
          child: Text(
              '${AppDataManager.of(context).alignmentList.alignment[i].name}  \n${AppDataManager.of(context).alignmentList.alignment[i].codename}', textAlign: TextAlign.center,)),
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                AppDataManager.of(context).alignmentList.alignment[i].desc,
                maxLines: null,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
        ),
      ],
    );
  }
}
