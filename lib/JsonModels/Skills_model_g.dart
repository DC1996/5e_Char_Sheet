// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Skills_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSkills _$ListSkillsFromJson(List<dynamic> json) {
  return ListSkills((json)
      ?.map(
          (e) => e == null ? null : Skills.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

List<dynamic> _$ListSkillsToJson(ListSkills instance) =>
    instance.skills;

Skills _$SkillsFromJson(Map<String, dynamic> json) {
  return Skills(json['name'] as String, json['desc'] as String);
}

Map<String, dynamic> _$SkillsToJson(Skills instance) =>
    <String, dynamic>{'name': instance.name, 'desc': instance.desc};
