// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeaponProperties_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListWeaponProperties _$ListWeaponPropertiesFromJson(List<dynamic> json) {
  return ListWeaponProperties((json)
      ?.map((e) =>
          e == null ? null : Property.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ListWeaponPropertiesToJson(
        ListWeaponProperties instance) =>
    <String, dynamic>{'properties': instance.properties};

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return Property(json['name'] as String,
      (json['desc'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$PropertyToJson(Property instance) =>
    <String, dynamic>{'name': instance.name, 'desc': instance.desc};
