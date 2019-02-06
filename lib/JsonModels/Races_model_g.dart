// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Races_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListRaces _$ListRacesFromJson(List<dynamic> json) {
  return ListRaces((json)
      ?.map((e) => e == null ? null : Race.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Race _$RaceFromJson(Map<String, dynamic> json) {
  return Race(
      json['name'] as String,
      json['speed'] as int,
      (json['ability_bonuses'] as List)?.map((e) => e as int)?.toList(),
      json['alignment'] as String,
      json['age'] as String,
      json['size_description'] as String,
      json['proficiency_options'] == null
          ? null
          : Choices.fromJson(
              json['proficiency_options'] as Map<String, dynamic>),
      (json['starting_proficiencies'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['languages'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['language_options'] == null
          ? null
          : Choices.fromJson(json['language_options'] as Map<String, dynamic>),
      json['language_desc'] as String,
      (json['traits'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['trait_options'] == null
          ? null
          : Choices.fromJson(json['trait_options'] as Map<String, dynamic>),
      (json['subraces'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$RaceToJson(Race instance) => <String, dynamic>{
      'name': instance.name,
      'speed': instance.speed,
      'ability_bonuses': instance.ability_bonuses,
      'alignment': instance.alignment,
      'age': instance.age,
      'size_description': instance.size_description,
      'proficiency_options': instance.proficiency_options,
      'starting_proficiencies': instance.starting_proficiencies,
      'languages': instance.languages,
      'language_options': instance.language_options,
      'language_desc': instance.language_desc,
      'traits': instance.traits,
      'trait_options': instance.trait_options,
      'subraces': instance.subraces
    };
