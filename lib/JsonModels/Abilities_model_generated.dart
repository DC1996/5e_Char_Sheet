// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AbilityScores_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListAbilities _$AbilityListFromJson(List<dynamic> json) {
  return ListAbilities((json)
      ?.map((e) =>
          e == null ? null : Abilities.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) {
  return Abilities(json['full_name'] as String, json['desc'] as String);
}
