import 'package:json_annotation/json_annotation.dart';

part 'Races_model.g.dart';

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
  List<Subrace> subraces;
  List<Language> languages;

  Race(
      this.name,
      this.speed,
      this.ability_bonuses,
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
