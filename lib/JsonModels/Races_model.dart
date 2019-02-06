import 'package:json_annotation/json_annotation.dart';

import 'HelperClassesForModels.dart';

part 'Races_model_g.dart';

@JsonSerializable()
class ListRaces extends Object {
  List<Race> races;

  ListRaces(this.races);

  factory ListRaces.fromJson(List<dynamic> json) => _$ListRacesFromJson(json);
}

@JsonSerializable()
class Race extends Object {
  String name;
  int speed;
  List<int> ability_bonuses;
  String alignment;
  String age;
  String size_description;
  Choices proficiency_options;
  List<Names> starting_proficiencies;
  List<Names> languages;
  Choices language_options;
  String language_desc;
  List<Names> traits;
  Choices trait_options;
  List<Names> subraces;


  Race(this.name, this.speed, this.ability_bonuses, this.alignment, this.age,
      this.size_description, this.proficiency_options,
      this.starting_proficiencies, this.languages, this.language_options,
      this.language_desc, this.traits, this.trait_options, this.subraces);

  factory Race.fromJson(Map<String, dynamic> json) => _$RaceFromJson(json);
}