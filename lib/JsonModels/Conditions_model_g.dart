// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Conditions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListConditions _$ListConditionsFromJson(List<dynamic> json) {
  return ListConditions((json)
      ?.map((e) =>
          e == null ? null : Condition.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ListConditionsToJson(ListConditions instance) =>
    <String, dynamic>{'conditions': instance.conditions};

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition(json['name'] as String,
      (json['desc'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$ConditionToJson(Condition instance) =>
    <String, dynamic>{'name': instance.name, 'desc': instance.desc};
