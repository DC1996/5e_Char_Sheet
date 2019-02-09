import 'package:json_annotation/json_annotation.dart';

import 'HelperClassesForModels.dart';

part 'EquipmentCategory_model_g.dart';

@JsonSerializable()
class ListEqCategories extends Object {
  List<Category> eqCategories;

  ListEqCategories(this.eqCategories);

  factory ListEqCategories.fromJson(List<dynamic> json) => _$ListEqCategoriesFromJson(json);
}

@JsonSerializable()
class Category extends Object {
  String name;
  List<Names> equipment;

  Category(this.name, this.equipment);

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}