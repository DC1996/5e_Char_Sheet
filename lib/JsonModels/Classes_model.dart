import 'package:json_annotation/json_annotation.dart';

part 'Classes_model.g.dart';

@JsonSerializable()
class ListClasses extends Object {
  List<Classes> classes;

  ListClasses(this.classes);

  factory ListClasses.fromJson(List<dynamic> json) => _$ListClassesFromJson(json);
}

@JsonSerializable()
class Classes extends Object {
  String name;

  Classes(this.name);

  factory Classes.fromJson(Map<String, dynamic> json) => _$ClassesFromJson(json);
}