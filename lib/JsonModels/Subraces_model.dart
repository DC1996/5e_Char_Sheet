import 'package:json_annotation/json_annotation.dart';

import 'HelperClassesForModels.dart';

part 'Subraces_model_g.dart';

@JsonSerializable()
class SubraceList extends Object {
  List<Subrace> subraces;

  SubraceList(this.subraces);

  factory SubraceList.fromJson(List<dynamic> json) => _$SubraceListFromJson(json);

}

@JsonSerializable()
class Subrace extends Object {
  String name;
  Names race;
  String desc;
  List<int> ability_bonuses;
  List<Names> starting_proficiencies;
  Choices starting_proficiency_options;
  List<Names> languages;
  Choices language_options;
  List<Names> racial_traits;
  Choices racial_traits_options;

  Subrace(this.name, this.race, this.desc, this.ability_bonuses,
      this.starting_proficiencies, this.starting_proficiency_options,
      this.languages, this.language_options, this.racial_traits,
      this.racial_traits_options);

  factory Subrace.fromJson(Map<String, dynamic> json) => _$SubraceFromJson(json);

}