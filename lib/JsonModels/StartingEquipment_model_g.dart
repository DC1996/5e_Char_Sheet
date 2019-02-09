// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StartingEquipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartingEqList _$StartingEqListFromJson(List<dynamic> json) {
  return StartingEqList((json)
      ?.map((e) =>
          e == null ? null : StartingEq.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$StartingEqListToJson(StartingEqList instance) =>
    <String, dynamic>{'startingEqList': instance.startingEqList};

StartingEq _$StartingEqFromJson(Map<String, dynamic> json) {
  return StartingEq(
      json['className'] as String,
      (json['startingEquipment'] as List)
          ?.map((e) =>
              e == null ? null : Items.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['choices'] as List)
          ?.map((e) =>
              e == null ? null : EqChoices.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$StartingEqToJson(StartingEq instance) =>
    <String, dynamic>{
      'className': instance.className,
      'startingEquipment': instance.startingEquipment,
      'choices': instance.choices
    };

EqChoices _$EqChoicesFromJson(Map<String, dynamic> json) {
  return EqChoices(
      json['choose'] as int,
      json['type'] as String,
      (json['from'] as List)
          ?.map((e) =>
              e == null ? null : Items.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$EqChoicesToJson(EqChoices instance) => <String, dynamic>{
      'choose': instance.choose,
      'type': instance.type,
      'from': instance.from
    };

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(json['name'] as String, json['quantity'] as int);
}

Map<String, dynamic> _$ItemsToJson(Items instance) =>
    <String, dynamic>{'name': instance.name, 'quantity': instance.quantity};
