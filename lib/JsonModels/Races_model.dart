import 'package:json_annotation/json_annotation.dart';

part 'Races_model_generated.dart';

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
  String language_desc;
  List<Subrace> subraces;
  List<Language> languages;

  Race(
      this.name,
      this.speed,
      this.ability_bonuses,
      this.alignment,
      this.age,
      this.size_description,
      this.language_desc,
      this.subraces,
      this.languages
  );

  factory Race.fromJson(Map<String, dynamic> json) => _$RaceFromJson(json);
}

@JsonSerializable()
class Subrace extends Object {
  String name;

  Subrace(this.name);

  factory Subrace.fromJson(Map<String, dynamic> json) =>
      _$SubraceFromJson(json);
}

@JsonSerializable()
class Language extends Object {
  String name;

  Language(this.name);

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}
