// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Subraces_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubraceList _$SubraceListFromJson(List<dynamic> json) {
  return SubraceList((json)
      ?.map(
          (e) => e == null ? null : Subrace.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Subrace _$SubraceFromJson(Map<String, dynamic> json) {
  return Subrace(
      json['name'] as String,
      json['race'] == null
          ? null
          : Names.fromJson(json['race'] as Map<String, dynamic>),
      json['desc'] as String,
      (json['ability_bonuses'] as List)?.map((e) => e as int)?.toList(),
      (json['starting_proficiencies'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['starting_proficiency_options'] == null
          ? null
          : Choices.fromJson(
              json['starting_proficiency_options'] as Map<String, dynamic>),
      (json['languages'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['language_options'] == null
          ? null
          : Choices.fromJson(json['language_options'] as Map<String, dynamic>),
      (json['racial_traits'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['racial_traits_options'] == null
          ? null
          : Choices.fromJson(
              json['racial_traits_options'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SubraceToJson(Subrace instance) => <String, dynamic>{
      'name': instance.name,
      'race': instance.race,
      'desc': instance.desc,
      'ability_bonuses': instance.ability_bonuses,
      'starting_proficiencies': instance.starting_proficiencies,
      'starting_proficiency_options': instance.starting_proficiency_options,
      'languages': instance.languages,
      'language_options': instance.language_options,
      'racial_traits': instance.racial_traits,
      'racial_traits_options': instance.racial_traits_options
    };
