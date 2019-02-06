import 'package:json_annotation/json_annotation.dart';

import 'HelperClassesForModels.dart';

part 'Classes_model_g.dart';

@JsonSerializable()
class ListClasses extends Object {
  List<Classes> classes;

  ListClasses(this.classes);

  factory ListClasses.fromJson(List<dynamic> json) => _$ListClassesFromJson(json);
}

@JsonSerializable()
class Classes extends Object {
  String name;
  int hit_die;
  List<Choices> proficiency_choices;
  List<Names> proficiencies;
  List<Names> saving_throws;
  Specified starting_equipment;
  Specified class_levels;
  List<Names> subclasses;
  Specified spellcasting;


  Classes(this.name, this.hit_die, this.proficiency_choices, this.proficiencies,
      this.saving_throws, this.starting_equipment, this.class_levels,
      this.subclasses, this.spellcasting);

  factory Classes.fromJson(Map<String, dynamic> json) => _$ClassesFromJson(json);
}