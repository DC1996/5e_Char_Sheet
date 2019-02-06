// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DamageType_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListDamageTypes _$ListDamageTypesFromJson(List<dynamic> json) {
  return ListDamageTypes((json)
      ?.map((e) =>
          e == null ? null : DamageType.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

DamageType _$DamageTypeFromJson(Map<String, dynamic> json) {
  return DamageType(json['name'] as String, json['desc'] as String);
}