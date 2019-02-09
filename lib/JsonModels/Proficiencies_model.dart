import 'package:json_annotation/json_annotation.dart';

part 'Proficiencies_model_g.dart';


@JsonSerializable()
class ProficiencyList extends Object {
  List<Proficiency> proficiencies;

  ProficiencyList(this.proficiencies);

  factory ProficiencyList.fromJson(List<dynamic> json) => _$ProficiencyListFromJson(json);
}

@JsonSerializable()
class Proficiency extends Object {
  String type;
  String name;

  Proficiency(this.type, this.name);

  factory Proficiency.fromJson(Map<String, dynamic> json) => _$ProficiencyFromJson(json);
}