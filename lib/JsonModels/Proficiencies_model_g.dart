// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Proficiencies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProficiencyList _$ProficiencyListFromJson(List<dynamic> json) {
  return ProficiencyList((json)
      ?.map((e) =>
          e == null ? null : Proficiency.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ProficiencyListToJson(ProficiencyList instance) =>
    <String, dynamic>{'proficiencies': instance.proficiencies};

Proficiency _$ProficiencyFromJson(Map<String, dynamic> json) {
  return Proficiency(json['type'] as String, json['name'] as String);
}

Map<String, dynamic> _$ProficiencyToJson(Proficiency instance) =>
    <String, dynamic>{'type': instance.type, 'name': instance.name};
