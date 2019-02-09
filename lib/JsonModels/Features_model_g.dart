// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Features_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFeatures _$ListFeaturesFromJson(List<dynamic> json) {
  return ListFeatures((json)
      ?.map(
          (e) => e == null ? null : Feature.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ListFeaturesToJson(ListFeatures instance) =>
    <String, dynamic>{'features': instance.features};

Feature _$FeatureFromJson(Map<String, dynamic> json) {
  return Feature(
      json['className'] == null
          ? null
          : Names.fromJson(json['className'] as Map<String, dynamic>),
      json['subclass'] == null
          ? null
          : Names.fromJson(json['subclass'] as Map<String, dynamic>),
      json['name'] as String,
      json['level'] as int,
      (json['desc'] as List)?.map((e) => e as String)?.toList(),
      json['choice'] == null
          ? null
          : Choices.fromJson(json['choice'] as Map<String, dynamic>));
}

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'className': instance.className,
      'subclass': instance.subclass,
      'name': instance.name,
      'level': instance.level,
      'desc': instance.desc,
      'choice': instance.choice
    };
