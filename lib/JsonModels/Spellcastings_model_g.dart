// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Spellcastings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellcastingList _$SpellcastingListFromJson(List<dynamic> json) {
  return SpellcastingList((json)
      ?.map((e) =>
          e == null ? null : Spellcasting.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$SpellcastingListToJson(SpellcastingList instance) =>
    <String, dynamic>{'spellcasting': instance.spellcasting};

Spellcasting _$SpellcastingFromJson(Map<String, dynamic> json) {
  return Spellcasting(
      json['ofClass'] == null
          ? null
          : Names.fromJson(json['ofClass'] as Map<String, dynamic>),
      json['level'] as int,
      json['spellcasting_ability'] == null
          ? null
          : Names.fromJson(
              json['spellcasting_ability'] as Map<String, dynamic>),
      (json['info'] as List)
          ?.map((e) =>
              e == null ? null : Info.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SpellcastingToJson(Spellcasting instance) =>
    <String, dynamic>{
      'ofClass': instance.ofClass,
      'level': instance.level,
      'spellcasting_ability': instance.spellcasting_ability,
      'info': instance.info
    };

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(json['name'] as String,
      (json['desc'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$InfoToJson(Info instance) =>
    <String, dynamic>{'name': instance.name, 'desc': instance.desc};
