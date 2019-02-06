// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Classes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListClasses _$ListClassesFromJson(List<dynamic> json) {
  return ListClasses((json)
      ?.map(
          (e) => e == null ? null : Classes.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Classes _$ClassesFromJson(Map<String, dynamic> json) {
  return Classes(
      json['name'] as String,
      json['hit_die'] as int,
      (json['proficiency_choices'] as List)
          ?.map((e) =>
              e == null ? null : Choices.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['proficiencies'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['saving_throws'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['starting_equipment'] == null
          ? null
          : Specified.fromJson(
              json['starting_equipment'] as Map<String, dynamic>),
      json['class_levels'] == null
          ? null
          : Specified.fromJson(json['class_levels'] as Map<String, dynamic>),
      (json['subclasses'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['spellcasting'] == null
          ? null
          : Specified.fromJson(json['spellcasting'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ClassesToJson(Classes instance) => <String, dynamic>{
      'name': instance.name,
      'hit_die': instance.hit_die,
      'proficiency_choices': instance.proficiency_choices,
      'proficiencies': instance.proficiencies,
      'saving_throws': instance.saving_throws,
      'starting_equipment': instance.starting_equipment,
      'class_levels': instance.class_levels,
      'subclasses': instance.subclasses,
      'spellcasting': instance.spellcasting
    };
