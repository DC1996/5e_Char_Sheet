import 'package:json_annotation/json_annotation.dart';

//import 'HelperClassesForModels.dart';

part 'Conditions_model_g.dart';

@JsonSerializable()
class ListConditions extends Object {
  List<Condition> conditions;

  ListConditions(this.conditions);

  factory ListConditions.fromJson(List<dynamic> json) => _$ListConditionsFromJson(json);
}

@JsonSerializable()
class Condition extends Object {
  String name;
  List<String> desc;

  Condition(this.name, this.desc);

  factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);
}