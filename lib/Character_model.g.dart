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
      charInit: json['charInit'] as int,
      charSpeed: json['charSpeed'] as int,
      charHealth: json['charHealth'] == null
          ? null
          : Health.fromJson(json['charHealth'] as Map<String, dynamic>),
      charAbTable: json['charAbTable'] == null
          ? null
          : AbilityTable.fromJson(json['charAbTable'] as Map<String, dynamic>),
      charRace: json['charRace'] as String,
      charAlignment: json['charAlignment'] as String,
      charBackground: json['charBackground'] as String,
      charFeatures: json['charFeatures'] as String,
      charArmorProf: json['charArmorProf'] as String,
      charWeaponProf: json['charWeaponProf'] as String,
      charToolProf: json['charToolProf'] as String,
      charLanguagesKnown: json['charLanguagesKnown'] as String,
      charPersonality: json['charPersonality'] as String);
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'charName': instance.charName,
      'charImagePath': instance.charImagePath,
      'charClass': instance.charClass,
      'charAC': instance.charAC,
      'charInit': instance.charInit,
      'charSpeed': instance.charSpeed,
      'charHealth': instance.charHealth,
      'charAbTable': instance.charAbTable,
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

AbilityTable _$AbilityTableFromJson(Map<String, dynamic> json) {
  return AbilityTable(
      json['strength'] == null
          ? null
          : Strength.fromJson(json['strength'] as Map<String, dynamic>),
      json['dexterity'] == null
          ? null
          : Dexterity.fromJson(json['dexterity'] as Map<String, dynamic>),
      json['constitution'] == null
          ? null
          : Constitution.fromJson(json['constitution'] as Map<String, dynamic>),
      json['intelligence'] == null
          ? null
          : Intelligence.fromJson(json['intelligence'] as Map<String, dynamic>),
      json['wisdom'] == null
          ? null
          : Wisdom.fromJson(json['wisdom'] as Map<String, dynamic>),
      json['charisma'] == null
          ? null
          : Charisma.fromJson(json['charisma'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AbilityTableToJson(AbilityTable instance) =>
    <String, dynamic>{
      'strength': instance.strength,
      'dexterity': instance.dexterity,
      'constitution': instance.constitution,
      'intelligence': instance.intelligence,
      'wisdom': instance.wisdom,
      'charisma': instance.charisma
    };

Strength _$StrengthFromJson(Map<String, dynamic> json) {
  return Strength(json['score'] as int, json['mod'] as int, json['save'] as int,
      json['athletics'] as int);
}

Map<String, dynamic> _$StrengthToJson(Strength instance) => <String, dynamic>{
      'score': instance.score,
      'mod': instance.mod,
      'save': instance.save,
      'athletics': instance.athletics
    };

Dexterity _$DexterityFromJson(Map<String, dynamic> json) {
  return Dexterity(
      json['score'] as int,
      json['mod'] as int,
      json['save'] as int,
      json['acrobatics'] as int,
      json['sleightOfHand'] as int,
      json['stealth'] as int);
}

Map<String, dynamic> _$DexterityToJson(Dexterity instance) => <String, dynamic>{
      'score': instance.score,
      'mod': instance.mod,
      'save': instance.save,
      'acrobatics': instance.acrobatics,
      'sleightOfHand': instance.sleightOfHand,
      'stealth': instance.stealth
    };

Constitution _$ConstitutionFromJson(Map<String, dynamic> json) {
  return Constitution(
      json['score'] as int, json['mod'] as int, json['save'] as int);
}

Map<String, dynamic> _$ConstitutionToJson(Constitution instance) =>
    <String, dynamic>{
      'score': instance.score,
      'mod': instance.mod,
      'save': instance.save
    };

Intelligence _$IntelligenceFromJson(Map<String, dynamic> json) {
  return Intelligence(
      json['score'] as int,
      json['mod'] as int,
      json['save'] as int,
      json['arcana'] as int,
      json['history'] as int,
      json['investigation'] as int,
      json['nature'] as int,
      json['religion'] as int);
}

Map<String, dynamic> _$IntelligenceToJson(Intelligence instance) =>
    <String, dynamic>{
      'score': instance.score,
      'mod': instance.mod,
      'save': instance.save,
      'arcana': instance.arcana,
      'history': instance.history,
      'investigation': instance.investigation,
      'nature': instance.nature,
      'religion': instance.religion
    };

Wisdom _$WisdomFromJson(Map<String, dynamic> json) {
  return Wisdom(
      json['score'] as int,
      json['mod'] as int,
      json['save'] as int,
      json['animalHandling'] as int,
      json['insight'] as int,
      json['medicine'] as int,
      json['perception'] as int,
      json['survival'] as int);
}

Map<String, dynamic> _$WisdomToJson(Wisdom instance) => <String, dynamic>{
      'score': instance.score,
      'mod': instance.mod,
      'save': instance.save,
      'animalHandling': instance.animalHandling,
      'insight': instance.insight,
      'medicine': instance.medicine,
      'perception': instance.perception,
      'survival': instance.survival
    };

Charisma _$CharismaFromJson(Map<String, dynamic> json) {
  return Charisma(
      json['score'] as int,
      json['mod'] as int,
      json['save'] as int,
      json['deception'] as int,
      json['intimidation'] as int,
      json['performance'] as int,
      json['persuasion'] as int);
}

Map<String, dynamic> _$CharismaToJson(Charisma instance) => <String, dynamic>{
      'score': instance.score,
      'mod': instance.mod,
      'save': instance.save,
      'deception': instance.deception,
      'intimidation': instance.intimidation,
      'performance': instance.performance,
      'persuasion': instance.persuasion
    };
