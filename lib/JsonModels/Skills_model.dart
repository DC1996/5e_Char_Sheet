import 'package:json_annotation/json_annotation.dart';

part 'Skills_model_generated.dart';

@JsonSerializable()
class ListSkills extends Object {
  List<Skills> skills;

  ListSkills(this.skills);

  factory ListSkills.fromJson(List<dynamic> json) => _$ListSkillsFromJson(json);
}

@JsonSerializable()
class Skills extends Object {
  String name;
  String desc;

  Skills(this.name, this.desc);

  factory Skills.fromJson(Map<String, dynamic> json) => _$SkillsFromJson(json);

}

