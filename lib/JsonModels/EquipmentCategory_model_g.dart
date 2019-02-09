// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EquipmentCategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListEqCategories _$ListEqCategoriesFromJson(List<dynamic> json) {
  return ListEqCategories((json)
      ?.map((e) =>
          e == null ? null : Category.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ListEqCategoriesToJson(ListEqCategories instance) =>
    <String, dynamic>{'eqCategories': instance.eqCategories};

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
      json['name'] as String,
      (json['equipment'] as List)
          ?.map((e) =>
              e == null ? null : Names.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CategoryToJson(Category instance) =>
    <String, dynamic>{'name': instance.name, 'equipment': instance.equipment};
