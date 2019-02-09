// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Alignments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListAlignments _$ListAlignmentsFromJson(List<dynamic> json) {
  return ListAlignments((json)
      ?.map((e) => e == null ? null : Alignments.fromJson(e))
      ?.toList());
}

Alignments _$AlignmentsFromJson(Map<String, dynamic> json) {
  return Alignments(json['name'] as String, json['codename'] as String,
      json['desc'] as String);
}
