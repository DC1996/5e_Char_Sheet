// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MagicSchools_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMagicSchools _$ListMagicSchoolsFromJson(List<dynamic> json) {
  return ListMagicSchools((json)
      ?.map((e) =>
          e == null ? null : MagicSchool.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ListMagicSchoolsToJson(ListMagicSchools instance) =>
    <String, dynamic>{'magicSchools': instance.magicSchools};

MagicSchool _$MagicSchoolFromJson(Map<String, dynamic> json) {
  return MagicSchool(json['name'] as String, json['desc'] as String);
}

Map<String, dynamic> _$MagicSchoolToJson(MagicSchool instance) =>
    <String, dynamic>{'name': instance.name, 'desc': instance.desc};
