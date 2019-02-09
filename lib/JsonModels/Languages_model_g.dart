// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Languages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListLanguages _$ListLanguagesFromJson(List<dynamic> json) {
  return ListLanguages((json)
      ?.map((e) => e == null ? null : Names.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ListLanguagesToJson(ListLanguages instance) =>
    <String, dynamic>{'languages': instance.languages};
