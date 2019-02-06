// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Traits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TraitsList _$TraitsListFromJson(List<dynamic> json) {
  return TraitsList((json)
      ?.map((e) => e == null ? null : Trait.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$TraitsListToJson(TraitsList instance) =>
    <String, dynamic>{'traits': instance.traits};

Trait _$TraitFromJson(Map<String, dynamic> json) {
  return Trait(json['name'] as String,
      (json['desc'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$TraitToJson(Trait instance) =>
    <String, dynamic>{'name': instance.name, 'desc': instance.desc};
