// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Spells_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSpells _$ListSpellsFromJson(List<dynamic> json) {
  return ListSpells((json)
      ?.map((e) => e == null ? null : Spell.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ListSpellsToJson(ListSpells instance) =>
    <String, dynamic>{'spells': instance.spells};

Spell _$SpellFromJson(Map<String, dynamic> json) {
  return Spell(
      json['name'] as String,
      (json['desc'] as List)?.map((e) => e as String)?.toList(),
      (json['higher_level'] as List)?.map((e) => e as String)?.toList(),
      json['range'] as String,
      (json['components'] as List)?.map((e) => e as String)?.toList(),
      json['material'] as String,
      json['ritual'] as String,
      json['duration'] as String,
      json['concentration'] as String,
      json['casting_time'] as String,
      json['level'] as int,
      (json['classes'] as List)
          ?.map((e) =>
              e == null ? null : SpellClass.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['subclasses'] as List)
          ?.map((e) =>
              e == null ? null : SpellClass.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SpellToJson(Spell instance) => <String, dynamic>{
      'name': instance.name,
      'desc': instance.desc,
      'higher_level': instance.higher_level,
      'range': instance.range,
      'components': instance.components,
      'material': instance.material,
      'ritual': instance.ritual,
      'duration': instance.duration,
      'concentration': instance.concentration,
      'casting_time': instance.casting_time,
      'level': instance.level,
      'classes': instance.classes,
      'subclasses': instance.subclasses
    };

SpellClass _$SpellClassFromJson(Map<String, dynamic> json) {
  return SpellClass(json['name'] as String);
}

Map<String, dynamic> _$SpellClassToJson(SpellClass instance) =>
    <String, dynamic>{'name': instance.name};
