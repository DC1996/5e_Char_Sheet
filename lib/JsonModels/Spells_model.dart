import 'package:json_annotation/json_annotation.dart';

part 'Spells_model_generated.dart';

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

  String get description {
    StringBuffer description = StringBuffer();
    this.desc.forEach((string) {
      description.write(string);
    });
    return description.toString();
  }

  String get higherLevel {
    StringBuffer higherLevel = StringBuffer();
    if(this.higher_level != null) {
      higher_level.forEach((string) {
        higherLevel.write(string);
      });
      return higherLevel.toString();
    }
    else return "--";
  }

  String get spellComponents {
    StringBuffer components = StringBuffer();
    for(int i = 0; i < this.components.length; i++) {
      if(i == 0) components.write(this.components[i]);
      else components.write("," + this.components[i]);
    }
    return components.toString();
  }

  String get spellClasses {
    StringBuffer classes = StringBuffer();
    for(int i = 0; i < this.classes.length; i++) {
      if(i == 0) classes.write(this.classes[i].name);
      else classes.write("/" + this.classes[i].name);
    }
    return classes.toString();
  }

  //subclasses maybe sometimes in the future...

}

@JsonSerializable()
class SpellClass extends Object {
  String name;

  SpellClass(this.name);

  factory SpellClass.fromJson(Map<String, dynamic> json) =>
      _$SpellClassFromJson(json);
}
