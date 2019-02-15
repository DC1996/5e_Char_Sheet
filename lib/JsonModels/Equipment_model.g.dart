// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListEquipment _$ListEquipmentFromJson(List<dynamic> json) {
  return ListEquipment((json)
      ?.map((e) =>
          e == null ? null : Equipment.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ListEquipmentToJson(ListEquipment instance) =>
    <String, dynamic>{'equipment': instance.equipment};

Equipment _$EquipmentFromJson(Map<String, dynamic> json) {
  return Equipment(
      json['index'] as int,
      json['name'] as String,
      json['equipment_category'] as String,
      json['cost'] == null
          ? null
          : Unit.fromJson(json['cost'] as Map<String, dynamic>),
      json['weight'],
      json['weapon_category'] as String,
      json['weapon_range'] as String,
      json['damage'] == null
          ? null
          : Damage.fromJson(json['damage'] as Map<String, dynamic>),
      json['range'] == null
          ? null
          : Range.fromJson(json['range'] as Map<String, dynamic>),
      (json['properties'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['throw_range'] == null
          ? null
          : Range.fromJson(json['throw_range'] as Map<String, dynamic>),
      (json['special'] as List)?.map((e) => e as String)?.toList(),
      json['armor_category'] as String,
      json['armor_class'] == null
          ? null
          : ArmorClass.fromJson(json['armor_class']),
      json['stealth_disadvantage'] as bool,
      json['gear_category'] as String,
      (json['contents'] as List)
          ?.map((e) =>
              e == null ? null : Content.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['desc'] as List)?.map((e) => e as String)?.toList(),
      json['tool_category'] as String,
      json['vehicle_category'] as String,
      json['speed'] == null
          ? null
          : Unit.fromJson(json['speed'] as Map<String, dynamic>),
      json['capacity'] as String);
}

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'equipment_category': instance.equipment_category,
      'cost': instance.cost,
      'weight': instance.weight,
      'weapon_category': instance.weapon_category,
      'weapon_range': instance.weapon_range,
      'damage': instance.damage,
      'range': instance.range,
      'properties': instance.properties,
      'throw_range': instance.throw_range,
      'special': instance.special,
      'armor_category': instance.armor_category,
      'armor_class': instance.armor_class,
      'stealth_disadvantage': instance.stealth_disadvantage,
      'gear_category': instance.gear_category,
      'contents': instance.contents,
      'desc': instance.desc,
      'tool_category': instance.tool_category,
      'vehicle_category': instance.vehicle_category,
      'speed': instance.speed,
      'capacity': instance.capacity
    };

Unit _$UnitFromJson(Map<String, dynamic> json) {
  return Unit(json['quantity'], json['unit'] as String);
}

Map<String, dynamic> _$UnitToJson(Unit instance) =>
    <String, dynamic>{'quantity': instance.quantity, 'unit': instance.unit};

Damage _$DamageFromJson(Map<String, dynamic> json) {
  return Damage(
      json['dice_count'] as int,
      json['dice_value'] as int,
      json['damage_type'] == null
          ? null
          : Names.fromJson(json['damage_type'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DamageToJson(Damage instance) => <String, dynamic>{
      'dice_count': instance.dice_count,
      'dice_value': instance.dice_value,
      'damage_type': instance.damage_type
    };

Range _$RangeFromJson(Map<String, dynamic> json) {
  return Range(json['normal'] as int, json['long'] as int);
}

Map<String, dynamic> _$RangeToJson(Range instance) =>
    <String, dynamic>{'normal': instance.normal, 'long': instance.long};

ArmorClass _$ArmorClassFromJson(Map<String, dynamic> json) {
  return ArmorClass(
      json['base'] as int, json['dex_bonus'] as bool, json['max_bonus'] as int);
}

Map<String, dynamic> _$ArmorClassToJson(ArmorClass instance) =>
    <String, dynamic>{
      'base': instance.base,
      'dex_bonus': instance.dex_bonus,
      'max_bonus': instance.max_bonus
    };

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(json['index'] as String, json['quantity']);
}

Map<String, dynamic> _$ContentToJson(Content instance) =>
    <String, dynamic>{'index': instance.index, 'quantity': instance.quantity};
