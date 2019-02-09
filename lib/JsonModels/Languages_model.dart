import 'package:json_annotation/json_annotation.dart';

import 'HelperClassesForModels.dart';

part 'Languages_model_g.dart';

@JsonSerializable()
class ListLanguages extends Object {
  List<Names> languages;

  ListLanguages(this.languages);

  factory ListLanguages.fromJson(List<dynamic> json) => _$ListLanguagesFromJson(json);
}