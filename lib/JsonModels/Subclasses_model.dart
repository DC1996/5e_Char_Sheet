import 'package:json_annotation/json_annotation.dart';

import 'HelperClassesForModels.dart';

part 'Subclasses_model_g.dart';


@JsonSerializable()
class SubclassList extends Object {
  List<Subclass> subclasses;

  SubclassList(this.subclasses);

  factory SubclassList.fromJson(List<dynamic> json) => _$SubclassListFromJson(json);
}


@JsonSerializable()
class Subclass extends Object {
  ClassName ofClass;
  String name;
  List<String> desc;
  List<Specified> features;
  List<SubSpells> spells;

  Subclass(this.ofClass, this.name, this.desc, this.features, this.spells);

  factory Subclass.fromJson(Map<String, dynamic> json) => _$SubclassFromJson(json);
}

@JsonSerializable()
class ClassName extends Object {
  String name;

  ClassName(this.name);

  factory ClassName.fromJson(Map<String, dynamic> json) => _$ClassNameFromJson(json);
}

@JsonSerializable()
class SubSpells extends Object {
  int level_acquired;
  //List of prerequisites
  Names name;

  SubSpells(this.level_acquired, this.name);

  factory SubSpells.fromJson(Map<String, dynamic> json) => _$SubSpellsFromJson(json);

}