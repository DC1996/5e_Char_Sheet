import 'package:json_annotation/json_annotation.dart';

part 'Alignments_model.g.dart';


@JsonSerializable()
class ListAlignments extends Object {
  List<Alignments> alignment;

  ListAlignments(this.alignment);

  factory ListAlignments.fromJson(List<dynamic> json) => _$ListAlignmentsFromJson(json);

}

@JsonSerializable()
class Alignments extends Object {
  String name;
  String codename;
  String desc;

  Alignments(this.name, this.codename, this.desc);

  factory Alignments.fromJson(Map<String, dynamic> json) => _$AlignmentsFromJson(json);

}