import 'package:json_annotation/json_annotation.dart';

import 'HelperClassesForModels.dart';

part 'Levels_model_g.dart';


@JsonSerializable()
class ListLevels extends Object {
  List<Level> levels;

  ListLevels(this.levels);

  factory ListLevels.fromJson(List<dynamic> json) => _$ListLevelsFromJson(json);
}


@JsonSerializable()
class Level extends Object {
  Names className;
  Names subclass;
  int level;
  int prof_bonus;
  List<Names> feature_choices;
  List<Names> features;
  SpellcastingSlots spellcasting;

  Level(this.className, this.subclass, this.level, this.prof_bonus,
      this.feature_choices, this.features, this.spellcasting);

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
}


@JsonSerializable()
class SpellcastingSlots extends Object {
  int spells_known;
  int cantrips_know;
  int spell_slots_level_1;
  int spell_slots_level_2;
  int spell_slots_level_3;
  int spell_slots_level_4;
  int spell_slots_level_5;
  int spell_slots_level_6;
  int spell_slots_level_7;
  int spell_slots_level_8;
  int spell_slots_level_9;

  SpellcastingSlots(this.spells_known, this.cantrips_know,
      this.spell_slots_level_1, this.spell_slots_level_2,
      this.spell_slots_level_3, this.spell_slots_level_4,
      this.spell_slots_level_5, this.spell_slots_level_6,
      this.spell_slots_level_7, this.spell_slots_level_8,
      this.spell_slots_level_9);

  factory SpellcastingSlots.fromJson(Map<String, dynamic> json) => _$SpellcastingSlotsFromJson(json);
}