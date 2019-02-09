import 'package:json_annotation/json_annotation.dart';

part 'StartingEquipment_model_g.dart';


@JsonSerializable()
class StartingEqList extends Object {
  List<StartingEq> startingEqList;

  StartingEqList(this.startingEqList);

  factory StartingEqList.fromJson(List<dynamic> json) => _$StartingEqListFromJson(json);
}


@JsonSerializable()
class StartingEq extends Object {
  String className;
  List<Items> startingEquipment;
  List<EqChoices> choices;

  StartingEq(this.className, this.startingEquipment, this.choices);

  factory StartingEq.fromJson(Map<String, dynamic> json) => _$StartingEqFromJson(json);

}

@JsonSerializable()
class EqChoices extends Object {
  int choose;
  String type;
  List<Items> from;

  EqChoices(this.choose, this.type, this.from);

  factory EqChoices.fromJson(Map<String, dynamic> json) => _$EqChoicesFromJson(json);
}


@JsonSerializable()
class Items extends Object {
  String name;
  int quantity;


  Items(this.name, this.quantity);

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}