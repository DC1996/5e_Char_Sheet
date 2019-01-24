import 'package:json_annotation/json_annotation.dart';

part 'Spells_model.g.dart';

@JsonSerializable()
class ListSpells extends Object {
  List<Spell> spells;

  ListSpells(this.spells);

  factory ListSpells.fromJson(List<dynamic> json) => _$ListSpellsFromJson(json);
}

@JsonSerializable()
class Spell extends Object {
  String name;
  List<String> desc;
  List<String> higher_level;
  String range;
  List<String> components;
  String material;
  String ritual;
  String duration;
  String concentration;
  String casting_time;
  int level;
  List<SpellClass> classes;
  List<SpellClass> subclasses;

  Spell(
      this.name,
      this.desc,
      this.higher_level,
      this.range,
      this.components,
      this.material,
      this.ritual,
      this.duration,
      this.concentration,
      this.casting_time,
      this.level,
      this.classes,
      this.subclasses
   );

  factory Spell.fromJson(Map<String, dynamic> json) => _$SpellFromJson(json);
}

@JsonSerializable()
class SpellClass extends Object {
  String name;

  SpellClass(this.name);

  factory SpellClass.fromJson(Map<String, dynamic> json) =>
      _$SpellClassFromJson(json);
}
