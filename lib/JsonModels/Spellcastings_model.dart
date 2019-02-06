import 'package:json_annotation/json_annotation.dart';

import 'HelperClassesForModels.dart';

part 'Spellcastings_model_g.dart';


@JsonSerializable()
class SpellcastingList extends Object {
  List<Spellcasting> spellcasting;

  SpellcastingList(this.spellcasting);

  factory SpellcastingList.fromJson(List<dynamic> json) => _$SpellcastingListFromJson(json);
}


@JsonSerializable()
class Spellcasting extends Object {
  Names ofClass;
  int level;
  Names spellcasting_ability;
  List<Info> info;

  Spellcasting(this.ofClass, this.level, this.spellcasting_ability, this.info);

  factory Spellcasting.fromJson(Map<String, dynamic> json) => _$SpellcastingFromJson(json);
}


@JsonSerializable()
class Info extends Object {
  String name;
  List<String> desc;

  Info(this.name, this.desc);

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}