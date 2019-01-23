import 'package:json_annotation/json_annotation.dart';

part 'package:char_sheet_5e/JsonModels/Character_model.g.dart';

//@JsonSerializable()
class Character extends Object {
  String charName;
  String charImagePath;
  Class charClass; ///separate class
  //Info Bar
  int charAC;
  int charInit;
  int charSpeed;
  //Health Bar
  Health charHealth; /// separate class
  //Abilities and their skills
  AbilityTable charAbTable; ///separate class
  //Character Page Info
  String charRace;
  String charAlignment;
  String charBackground;
  String charFeatures;
  String charArmorProf;
  String charWeaponProf;
  String charToolProf;
  String charLanguagesKnown;
  String charPersonality;

  Character({
    this.charName,
    this.charImagePath,
    this.charClass,
    this.charAC,
    this.charInit,
    this.charSpeed,
    this.charHealth,
    this.charAbTable,

    this.charRace,
    this.charAlignment,
    this.charBackground,
    this.charFeatures,
    this.charArmorProf,
    this.charWeaponProf,
    this.charToolProf,
    this.charLanguagesKnown,
    this.charPersonality
  });

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

}

//-----------------------------------
/* The story unfolds */
//@JsonSerializable()
class Class extends Object {
  String className;
  int classLevel;
  int classExp;

  Class({
    this.className,
    this.classLevel,
    this.classExp
  });

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);
  Map<String, dynamic> toJson() => _$ClassToJson(this);

}

//@JsonSerializable()
class Health extends Object {
  int currentHP;
  int maxHp;
  int tempHP;
  int saveSuccs;
  int saveFails;

  Health({
    this.currentHP,
    this.maxHp,
    this.tempHP,
    this.saveSuccs,
    this.saveFails,
  });

  factory Health.fromJson(Map<String, dynamic> json) => _$HealthFromJson(json);
  Map<String, dynamic> toJson() => _$HealthToJson(this);

}

//@JsonSerializable()
class AbilityTable {
  Strength strength;
  Dexterity dexterity;
  Constitution constitution;
  Intelligence intelligence;
  Wisdom wisdom;
  Charisma charisma;

  AbilityTable(
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma
  );

  factory AbilityTable.fromJson(Map<String, dynamic> json) => _$AbilityTableFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityTableToJson(this);

}

//so we only have to declare the skills in each ability and use super-class constructor
class Ability extends Object {
  int score;
  int mod;
  int save;

  Ability(this.score, this.mod, this.save);
}

//@JsonSerializable()
class Strength extends Ability{
  int athletics;

  Strength(int score, int mod, int save, this.athletics)
      : super(score, mod, save);

  factory Strength.fromJson(Map<String, dynamic> json) => _$StrengthFromJson(json);
  Map<String, dynamic> toJson() => _$StrengthToJson(this);
}

//@JsonSerializable()
class Dexterity extends Ability{
  int acrobatics;
  int sleightOfHand;
  int stealth;

  Dexterity(int score, int mod, int save, this.acrobatics, this.sleightOfHand, this.stealth)
  : super(score, mod, save);

  factory Dexterity.fromJson(Map<String, dynamic> json) => _$DexterityFromJson(json);
  Map<String, dynamic> toJson() => _$DexterityToJson(this);

}

//@JsonSerializable()
class Constitution extends Ability {
  Constitution(int score, int mod, int save)
      : super(score, mod, save);

  factory Constitution.fromJson(Map<String, dynamic> json) => _$ConstitutionFromJson(json);
  Map<String, dynamic> toJson() => _$ConstitutionToJson(this);

}

//@JsonSerializable()
class Intelligence extends Ability {
  int arcana;
  int history;
  int investigation;
  int nature;
  int religion;

  Intelligence(int score, int mod, int save, this.arcana, this.history,
      this.investigation, this.nature, this.religion)
      : super(score, mod, save);

  factory Intelligence.fromJson(Map<String, dynamic> json) => _$IntelligenceFromJson(json);
  Map<String, dynamic> toJson() => _$IntelligenceToJson(this);

}

//@JsonSerializable()
class Wisdom extends Ability {
  int animalHandling;
  int insight;
  int medicine;
  int perception;
  int survival;

  Wisdom(int score, int mod, int save, this.animalHandling, this.insight,
      this.medicine, this.perception, this.survival)
      : super(score, mod, save);

  factory Wisdom.fromJson(Map<String, dynamic> json) => _$WisdomFromJson(json);
  Map<String, dynamic> toJson() => _$WisdomToJson(this);
}

//@JsonSerializable()
class Charisma extends Ability {
  int deception;
  int intimidation;
  int performance;
  int persuasion;

  Charisma(int score, int mod, int save, this. deception, this.intimidation,
      this.performance, this.persuasion)
      : super(score, mod, save);

  factory Charisma.fromJson(Map<String, dynamic> json) => _$CharismaFromJson(json);
  Map<String, dynamic> toJson() => _$CharismaToJson(this);
}
