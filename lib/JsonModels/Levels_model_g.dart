// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Levels_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListLevels _$ListLevelsFromJson(List<dynamic> json) {
  return ListLevels((json)
      ?.map((e) => e == null ? null : Level.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

List<dynamic> _$ListLevelsToJson(ListLevels instance) => instance.levels;

Level _$LevelFromJson(Map<String, dynamic> json) {
  return Level(
      json['className'] == null
          ? null
          : Names.fromJson(json['className'] as Map<String, dynamic>),
      json['subclass'] == null
          ? null
          : Names.fromJson(json['subclass'] as Map<String, dynamic>),
      json['level'] as int,
      json['prof_bonus'] as int,
      (json['feature_choices'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['features'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['spellcasting'] == null
          ? null
          : SpellcastingSlots.fromJson(
              json['spellcasting'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'className': instance.className,
      'subclass': instance.subclass,
      'level': instance.level,
      'prof_bonus': instance.prof_bonus,
      'feature_choices': instance.feature_choices,
      'features': instance.features,
      'spellcasting': instance.spellcasting
    };

SpellcastingSlots _$SpellcastingSlotsFromJson(Map<String, dynamic> json) {
  return SpellcastingSlots(
      json['spells_known'] as int,
      json['cantrips_know'] as int,
      json['spell_slots_level_1'] as int,
      json['spell_slots_level_2'] as int,
      json['spell_slots_level_3'] as int,
      json['spell_slots_level_4'] as int,
      json['spell_slots_level_5'] as int,
      json['spell_slots_level_6'] as int,
      json['spell_slots_level_7'] as int,
      json['spell_slots_level_8'] as int,
      json['spell_slots_level_9'] as int);
}

Map<String, dynamic> _$SpellcastingSlotsToJson(SpellcastingSlots instance) =>
    <String, dynamic>{
      'spells_known': instance.spells_known,
      'cantrips_know': instance.cantrips_know,
      'spell_slots_level_1': instance.spell_slots_level_1,
      'spell_slots_level_2': instance.spell_slots_level_2,
      'spell_slots_level_3': instance.spell_slots_level_3,
      'spell_slots_level_4': instance.spell_slots_level_4,
      'spell_slots_level_5': instance.spell_slots_level_5,
      'spell_slots_level_6': instance.spell_slots_level_6,
      'spell_slots_level_7': instance.spell_slots_level_7,
      'spell_slots_level_8': instance.spell_slots_level_8,
      'spell_slots_level_9': instance.spell_slots_level_9
    };
