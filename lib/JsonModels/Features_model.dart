import 'package:json_annotation/json_annotation.dart';

import 'HelperClassesForModels.dart';

part 'Features_model_g.dart';


@JsonSerializable()
class ListFeatures extends Object {
  List<Feature> features;

  ListFeatures(this.features);

  factory ListFeatures.fromJson(List<dynamic> json) => _$ListFeaturesFromJson(json);
}


@JsonSerializable()
class Feature extends Object {
   Names className;
   Names subclass;
   String name;
   int level;
   List<String> desc;
   Choices choice;

   Feature(this.className, this.subclass, this.name, this.level, this.desc,
       this.choice);

   factory Feature.fromJson(Map<String, dynamic> json) => _$FeatureFromJson(json);
}

