import 'package:json_annotation/json_annotation.dart';

part 'Abilities_model_generated.dart';


@JsonSerializable()
class ListAbilities extends Object {
  List<Abilities> abilities;

  ListAbilities(this.abilities);

  factory ListAbilities.fromJson(List<dynamic> json) => _$AbilityListFromJson(json);
}


@JsonSerializable()
class Abilities extends Object {
  String name;
  String desc;
  //List<Skills> skills

  Abilities(this.name, this.desc);

  factory Abilities.fromJson(Map<String, dynamic> json) => _$AbilitiesFromJson(json);
}