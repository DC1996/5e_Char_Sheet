import 'package:json_annotation/json_annotation.dart';

part 'Traits_model_g.dart';


@JsonSerializable()
class TraitsList extends Object {
  List<Trait> traits;

  TraitsList(this.traits);

  factory TraitsList.fromJson(List<dynamic> json) => _$TraitsListFromJson(json);
}


@JsonSerializable()
class Trait extends Object {
  String name;
  List<String> desc;

  Trait(this.name, this.desc);

  factory Trait.fromJson(Map<String, dynamic> json) => _$TraitFromJson(json);
}