import 'package:json_annotation/json_annotation.dart';
import 'package:char_sheet_5e/JsonModels/Spells_model.dart';

part 'Character_model_generated.dart';

@JsonSerializable()
class Character extends Object {
  String charName;
  String charImagePath;
  Class charClass; ///separate class
  //Info Bar
  int charAC;
  int charProf;
  int charSpeed;
  //Health Bar
  Health charHealth; /// separate class
  //Abilities
  AbilityTable charAbTable; ///separate class
  //Skills
  SkillsTable charSkillsTable; ///separate class
  //Spells
  List<Spell> charSpells;
  //Character Page Info
  String charRace;
  String charAlignment;
  String charBackground;
  String charFeatures;
  String charArmorProf;
  String charWeaponProf;
  String charToolProf;
  String charLanguagesKnown;
  String charPersonality;

  Character({
    this.charName,
    this.charImagePath,
    this.charClass,
    this.charAC,
    this.charProf,
    this.charSpeed,
    this.charHealth,
    this.charAbTable,
    this.charSpells,
    this.charRace,
    this.charAlignment,
    this.charBackground,
    this.charFeatures,
    this.charArmorProf,
    this.charWeaponProf,
    this.charToolProf,
    this.charLanguagesKnown,
    this.charPersonality
  });

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

}


@JsonSerializable()
class Class extends Object {
  String className;
  int classLevel;
  int classExp;

  Class({
    this.className,
    this.classLevel,
    this.classExp
  });

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);
  Map<String, dynamic> toJson() => _$ClassToJson(this);

}

@JsonSerializable()
class Health extends Object {
  int currentHP;
  int maxHp;
  int tempHP;
  int saveSuccs;
  int saveFails;

  Health({
    this.currentHP,
    this.maxHp,
    this.tempHP,
    this.saveSuccs,
    this.saveFails,
  });

  factory Health.fromJson(Map<String, dynamic> json) => _$HealthFromJson(json);
  Map<String, dynamic> toJson() => _$HealthToJson(this);

}

@JsonSerializable()
class AbilityTable extends Object {
  List<Ability> abilities;

  AbilityTable(this.abilities);

  factory AbilityTable.fromJson(List<dynamic> json) => _$AbilityTableFromJson(json);
  List<dynamic> toJson() => _$AbilityTableToJson(this);
}


@JsonSerializable()
class Ability extends Object {
  String name;
  String id;
  int score;
  bool save;

  Ability(this.name, this.id, this.score, this.save);

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class SkillsTable extends Object {
  List<Skill> skills;

  SkillsTable(this.skills);

  factory SkillsTable.fromJson(List<dynamic> json) => _$SkillsTableFromJson(json);
  List<dynamic> toJson() => _$SkillsTableToJson(this);

}

@JsonSerializable()
class Skill extends Object {
  String name;
  int ab;
  bool proficiency;
  bool doubleProficiency;

  Skill(this.name, this.ab, this.proficiency, this.doubleProficiency);


  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
  Map<String, dynamic> toJson() => _$SkillToJson(this);
}