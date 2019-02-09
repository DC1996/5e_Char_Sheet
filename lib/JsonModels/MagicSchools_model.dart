import 'package:json_annotation/json_annotation.dart';

import 'HelperClassesForModels.dart';

part 'MagicSchools_model_g.dart';


@JsonSerializable()
class ListMagicSchools extends Object {
  List<MagicSchool> magicSchools;

  ListMagicSchools(this.magicSchools);

  factory ListMagicSchools.fromJson(List<dynamic> json) => _$ListMagicSchoolsFromJson(json);
}

@JsonSerializable()
class MagicSchool extends Object {
  String name;
  String desc;

  MagicSchool(this.name, this.desc);

  factory MagicSchool.fromJson(Map<String, dynamic> json) => _$MagicSchoolFromJson(json);
}

