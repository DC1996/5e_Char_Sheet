import 'package:json_annotation/json_annotation.dart';

//import 'HelperClassesForModels.dart';

part 'WeaponProperties_model_g.dart';

@JsonSerializable()
class ListWeaponProperties extends Object {
  List<Property> properties;

  ListWeaponProperties(this.properties);

  factory ListWeaponProperties.fromJson(List<dynamic> json) => _$ListWeaponPropertiesFromJson(json);
}

@JsonSerializable()
class Property extends Object {
  String name;
  List<String> desc;

  Property(this.name, this.desc);

  factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);
}