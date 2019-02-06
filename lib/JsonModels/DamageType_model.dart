import 'package:json_annotation/json_annotation.dart';

part 'DamageType_model_g.dart';

@JsonSerializable()
class ListDamageTypes extends Object {
  List<DamageType> damageTypes;

  ListDamageTypes(this.damageTypes);

  factory ListDamageTypes.fromJson(List<dynamic> json) => _$ListDamageTypesFromJson(json);
}

@JsonSerializable()
class DamageType extends Object {
  String name;
  String desc;

  DamageType(this.name, this.desc);

  factory DamageType.fromJson(Map<String, dynamic> json) => _$DamageTypeFromJson(json);
}