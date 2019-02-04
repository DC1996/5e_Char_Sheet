// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Classes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListClasses _$ListClassesFromJson(List<dynamic> json) {
  return ListClasses((json)
      ?.map(
          (e) => e == null ? null : Classes.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Classes _$ClassesFromJson(Map<String, dynamic> json) {
  return Classes(json['name'] as String);
}
