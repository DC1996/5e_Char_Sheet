// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HelperClassesForModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Names _$NamesFromJson(Map<String, dynamic> json) {
  return Names(json['name'] as String);
}

Map<String, dynamic> _$NamesToJson(Names instance) =>
    <String, dynamic>{'name' : instance.name,};

Specified _$SpecifiedFromJson(Map<String, dynamic> json) {
  return Specified(json['class'] as String);
}

Choices _$ChoicesFromJson(Map<String, dynamic> json) {
  return Choices(
      json['choose'] as int,
      json['type'] as String,
      (json['from'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ChoicesToJson(Choices instance) => <String, dynamic>{
      'choose': instance.choose,
      'type': instance.type,
      'from': instance.from
    };
