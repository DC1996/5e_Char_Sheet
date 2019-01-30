import 'package:flutter/material.dart';
import 'package:char_sheet_5e/Widgets/Home/AbilityRow.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';

class SkillsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      //height: MediaQuery.of(context).size.height * 0.3,
      //width: MediaQuery.of(context).size.width * 0.975,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.006),
      decoration: new BoxDecoration(
        border: new Border.all(
          //color: Colors.grey,
          width: 2.0,
        ),
        color: Colors.black,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight:Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight:Radius.circular(10.0),
        ),
      ),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(5.0),
      child: GridView.builder(
          itemCount: 18,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.height * 0.0095,
            mainAxisSpacing: MediaQuery.of(context).size.height * 0.0155,
            crossAxisSpacing: MediaQuery.of(context).size.width * 0.0145,
          ),
          itemBuilder: (BuildContext context, int i) {
            return SkillContainer(i);
          }),
    );
  }
}

class SkillContainer extends StatelessWidget {
  final int i;

  SkillContainer(this.i);

  @override
  Widget build(BuildContext context) {
    var ab = AppDataManager.of(context).character.charSkillsTable.skills[i].ab;
    bool prof = AppDataManager.of(context).character.charSkillsTable.skills[i].proficiency;
    bool doubleprof = AppDataManager.of(context).character.charSkillsTable.skills[i].doubleProficiency;
    var score = ((AppDataManager.of(context).character.charAbTable.abilities[ab].score - 10) / 2).floor();
    var pr = AppDataManager.of(context).character.charProf;
    final value = prof == true ? score+pr : doubleprof == true ? score+pr+pr : score;

    return GestureDetector(
      onTap: null,
      onLongPress: () => showDialog(
      context: context, builder: (context) => SkillModify(i,)),
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.055),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(3.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(AppDataManager.of(context).character.charSkillsTable.skills[i].name, style: TextStyle(fontWeight: FontWeight.bold),),
              Text(value.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          )
      ),
    );
  }
}

class SkillModify extends StatelessWidget {
  final int i;

  SkillModify(this.i);

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    return new SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: Center(child: Text('${AppDataManager.of(context).skillList.skills[i].name}') ,),
      children: <Widget>[
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Proficiency: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
              ),
              Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  value: AppDataManager.of(context).character.charSkillsTable.skills[i].proficiency,
                  activeColor: Colors.black,
                  onChanged: (bool save) => data..prof(save, i))
            ],
          ),
        )
      ],
    );
  }
}


