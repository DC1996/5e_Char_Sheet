// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return Character(
      charName: json['charName'] as String,
      charImagePath: json['charImagePath'] as String,
      charClass: json['charClass'] == null
          ? null
          : Class.fromJson(json['charClass'] as Map<String, dynamic>),
      charAC: json['charAC'] as int,
      charProf: json['charProf'] as int,
      charSpeed: json['charSpeed'] as int,
      charHealth: json['charHealth'] == null
          ? null
          : Health.fromJson(json['charHealth'] as Map<String, dynamic>),
      charAbTable: json['charAbTable'] == null
          ? null
          : AbilityTable.fromJson(json['charAbTable'] as List),
      charRace: json['charRace'] as String,
      charAlignment: json['charAlignment'] as String,
      charBackground: json['charBackground'] as String,
      charFeatures: json['charFeatures'] as String,
      charArmorProf: json['charArmorProf'] as String,
      charWeaponProf: json['charWeaponProf'] as String,
      charToolProf: json['charToolProf'] as String,
      charLanguagesKnown: json['charLanguagesKnown'] as String,
      charPersonality: json['charPersonality'] as String)
    ..charSkillsTable = json['Skills'] == null
        ? null
        : SkillsTable.fromJson(json['Skills'] as List);
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'charName': instance.charName,
      'charImagePath': instance.charImagePath,
      'charClass': instance.charClass,
      'charAC': instance.charAC,
      'charProf': instance.charProf,
      'charSpeed': instance.charSpeed,
      'charHealth': instance.charHealth,
      'charAbTable': instance.charAbTable,
      'Skills': instance.charSkillsTable,
      'charRace': instance.charRace,
      'charAlignment': instance.charAlignment,
      'charBackground': instance.charBackground,
      'charFeatures': instance.charFeatures,
      'charArmorProf': instance.charArmorProf,
      'charWeaponProf': instance.charWeaponProf,
      'charToolProf': instance.charToolProf,
      'charLanguagesKnown': instance.charLanguagesKnown,
      'charPersonality': instance.charPersonality
    };

Class _$ClassFromJson(Map<String, dynamic> json) {
  return Class(
      className: json['className'] as String,
      classLevel: json['classLevel'] as int,
      classExp: json['classExp'] as int);
}

Map<String, dynamic> _$ClassToJson(Class instance) => <String, dynamic>{
      'className': instance.className,
      'classLevel': instance.classLevel,
      'classExp': instance.classExp
    };

Health _$HealthFromJson(Map<String, dynamic> json) {
  return Health(
      currentHP: json['currentHP'] as int,
      maxHp: json['maxHp'] as int,
      tempHP: json['tempHP'] as int,
      saveSuccs: json['saveSuccs'] as int,
      saveFails: json['saveFails'] as int);
}

Map<String, dynamic> _$HealthToJson(Health instance) => <String, dynamic>{
      'currentHP': instance.currentHP,
      'maxHp': instance.maxHp,
      'tempHP': instance.tempHP,
      'saveSuccs': instance.saveSuccs,
      'saveFails': instance.saveFails
    };

AbilityTable _$AbilityTableFromJson(List<dynamic> json) {
  return AbilityTable((json)
      ?.map(
          (e) => e == null ? null : Ability.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

List<dynamic> _$AbilityTableToJson(AbilityTable instance) =>
    instance.abilities;

Ability _$AbilityFromJson(Map<String, dynamic> json) {
  return Ability(json['name'] as String, json['id'] as String,
      json['score'] as int, json['save'] as bool);
}

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'score': instance.score,
      'save': instance.save
    };

SkillsTable _$SkillsTableFromJson(List<dynamic> json) {
  return SkillsTable((json)
      ?.map((e) => e == null ? null : Skill.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

List<dynamic> _$SkillsTableToJson(SkillsTable instance) =>
    instance.skills;

Skill _$SkillFromJson(Map<String, dynamic> json) {
  return Skill(json['name'] as String, json['ab'] as int, json['proficiency'] as bool,
      json['doubleProficiency'] as bool);
}

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'name': instance.name,
      'ab' : instance.ab,
      'proficiency': instance.proficiency,
      'doubleProficiency': instance.doubleProficiency
    };
