// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Subclasses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubclassList _$SubclassListFromJson(List<dynamic> json) {
  return SubclassList((json)
      ?.map((e) =>
          e == null ? null : Subclass.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$SubclassListToJson(SubclassList instance) =>
    <String, dynamic>{'subclasses': instance.subclasses};

Subclass _$SubclassFromJson(Map<String, dynamic> json) {
  return Subclass(
      json['ofClass'] == null
          ? null
          : ClassName.fromJson(json['ofClass'] as Map<String, dynamic>),
      json['name'] as String,
      (json['desc'] as List)?.map((e) => e as String)?.toList(),
      (json['features'] as List)
          ?.map((e) =>
              e == null ? null : Specified.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['spells'] as List)
          ?.map((e) =>
              e == null ? null : SubSpells.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SubclassToJson(Subclass instance) => <String, dynamic>{
      'ofClass': instance.ofClass,
      'name': instance.name,
      'desc': instance.desc,
      'features': instance.features,
      'spells': instance.spells
    };

ClassName _$ClassNameFromJson(Map<String, dynamic> json) {
  return ClassName(json['name'] as String);
}

Map<String, dynamic> _$ClassNameToJson(ClassName instance) =>
    <String, dynamic>{'name': instance.name};

SubSpells _$SubSpellsFromJson(Map<String, dynamic> json) {
  return SubSpells(
      json['level_acquired'] as int,
      json['name'] == null
          ? null
          : Names.fromJson(json['name'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SubSpellsToJson(SubSpells instance) => <String, dynamic>{
      'level_acquired': instance.level_acquired,
      'name': instance.name
    };
