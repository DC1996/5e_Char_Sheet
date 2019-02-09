import 'package:json_annotation/json_annotation.dart';

import 'HelperClassesForModels.dart';

part 'Equipment_model.g.dart';

@JsonSerializable()
class ListEquipment extends Object {
  List<Equipment> equipment;

  ListEquipment(this.equipment);

  factory ListEquipment.fromJson(List<dynamic> json) => _$ListEquipmentFromJson(json);
}


@JsonSerializable()
class Equipment extends Object {
  int index;
  String name;
  String equipment_category;
  Unit cost;
  int weight;

  String weapon_category;
  String weapon_range;
  Damage damage;
  Range range;
  List<Names> properties;
  Range throw_range;
  List<String> special;

  String armor_category;
  ArmorClass armor_class;
  bool stealth_disadvantage;

  String gear_category; //if Equipment Pack => display content
  List<Content> contents;
  List<String> desc;

  String tool_category;

  String vehicle_category;
  Unit speed;
  String capacity;

  Equipment(this.index, this.name, this.equipment_category, this.cost,
      this.weight, this.weapon_category, this.weapon_range, this.damage,
      this.range, this.properties, this.throw_range, this.special,
      this.armor_category, this.armor_class, this.stealth_disadvantage,
      this.gear_category, this.contents, this.desc, this.tool_category,
      this.vehicle_category, this.speed, this.capacity);

  factory Equipment.fromJson(Map<String, dynamic> json) => _$EquipmentFromJson(json);

}


@JsonSerializable()
class Unit extends Object {
  int quantity;
  String unit;

  Unit(this.quantity, this.unit);

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}


@JsonSerializable()
class Damage extends Object {
  int dice_count;
  int dice_value;
  Names damage_type;

  Damage(this.dice_count, this.dice_value, this.damage_type);

  factory Damage.fromJson(Map<String, dynamic> json) => _$DamageFromJson(json);
}


@JsonSerializable()
class Range extends Object {
  int normal;
  int long;

  Range(this.normal, this.long);

  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);
}


@JsonSerializable()
class ArmorClass extends Object {
  int base;
  bool dex_bonus;
  int max_bonus;

  ArmorClass(this.base, this.dex_bonus, this.max_bonus);

  factory ArmorClass.fromJson(Map<String, dynamic> json) => _$ArmorClassFromJson(json);
}


@JsonSerializable()
class Content extends Object {
  String index;
  int quantity;

  Content(this.index, this.quantity);

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
}