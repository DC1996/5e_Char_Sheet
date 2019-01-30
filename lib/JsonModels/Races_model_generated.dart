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

Map<String, dynamic> _$ListRacesToJson(ListRaces instance) =>
    <String, dynamic>{'races': instance.races};

Race _$RaceFromJson(Map<String, dynamic> json) {
  return Race(
      json['name'] as String,
      json['speed'] as int,
      (json['ability_bonuses'] as List)?.map((e) => e as int)?.toList(),
      json['alignment'] as String,
      json['age'] as String,
      json['size_description'] as String,
      (json['subraces'] as List)
          ?.map((e) =>
              e == null ? null : Subrace.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['languages'] as List)
          ?.map((e) =>
              e == null ? null : Language.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$RaceToJson(Race instance) => <String, dynamic>{
      'name': instance.name,
      'speed': instance.speed,
      'ability_bonuses': instance.ability_bonuses,
      'alignment': instance.alignment,
      'age' : instance.age,
      'size_description' : instance.size_description,
      'subraces': instance.subraces,
      'languages': instance.languages
    };

Subrace _$SubraceFromJson(Map<String, dynamic> json) {
  return Subrace(json['name'] as String);
}

Map<String, dynamic> _$SubraceToJson(Subrace instance) =>
    <String, dynamic>{'name': instance.name};

Language _$LanguageFromJson(Map<String, dynamic> json) {
  return Language(json['name'] as String);
}

Map<String, dynamic> _$LanguageToJson(Language instance) =>
    <String, dynamic>{'name': instance.name};
