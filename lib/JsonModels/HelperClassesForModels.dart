import 'package:json_annotation/json_annotation.dart';

part 'HelperClassesForModels_g.dart';

@JsonSerializable()
class Names extends Object {
  String name;

  Names(this.name);

  factory Names.fromJson(Map<String, dynamic> json) => _$NamesFromJson(json);
  Map<String, dynamic> toJson() => _$NamesToJson(this);
}

@JsonSerializable()
class Specified extends Object {
  String className;

  Specified(this.className);

  factory Specified.fromJson(Map<String, dynamic> json) => _$SpecifiedFromJson(json);
}

@JsonSerializable()
class Choices extends Object {
  int choose;
  String type;
  List<Names> from;

  Choices(this.choose, this.type, this.from);

  factory Choices.fromJson(Map<String, dynamic> json) => _$ChoicesFromJson(json);

}