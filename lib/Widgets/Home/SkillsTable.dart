import 'package:flutter/material.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';

class SkillsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.006),
      decoration: new BoxDecoration(
        //color: Colors.black,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight:Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight:Radius.circular(10.0),
        ),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(5.0),
      child: GridView.builder(
          itemCount: 18,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.height * 0.008,
            mainAxisSpacing: MediaQuery.of(context).size.height * 0.0165,
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
      onTap: () => showDialog (context: context, builder: (context) => SkillDescription(i, value)),
      onLongPress: () => showDialog(
      context: context, builder: (context) => SkillModify(i)),
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.035),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2.5,
            ),
            color: Colors.white,
            shape: BoxShape.rectangle,
            boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 1.0)],
            borderRadius: BorderRadius.circular(3.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(AppDataManager.of(context).character.charSkillsTable.skills[i].name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5, color: prof == true ? Color(0xFF008800) : Colors.black)
              ),
              Text(value.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: prof == true ? Color(0xFF008800) : Colors.black)
              )
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
                  onChanged: (bool save) => data..changeSkillProficiency(save, i))
            ],
          ),
        )
      ],
    );
  }
}

class SkillDescription extends StatelessWidget {
  final int i;
  final int value;

  SkillDescription(this.i, this.value);

  @override
  Widget build(BuildContext context) {
    final AppDataManagerState data = AppDataManager.of(context);
    return new SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: Center(child: Text('${AppDataManager.of(context).skillList.skills[i].name} ${(value < 0) ? "$value" : "+$value"}')),
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                AppDataManager.of(context).skillList.skills[i].desc,
                maxLines: null,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        ),
      ],
    );
  }
}


