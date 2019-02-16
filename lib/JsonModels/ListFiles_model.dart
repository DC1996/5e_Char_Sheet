//part of character files reading system
class ListFiles extends Object {
  List<String> filenames;
  String lastUsed;

  ListFiles(this.filenames, this.lastUsed);

  factory ListFiles.fromJson(Map<String, dynamic> json) {
    return ListFiles(
        (json['filenames'] as List)?.map((e) => e as String)?.toList(),
        json['lastUsed'] as String);
  }

  Map<String, dynamic> toJson() => _$FilesToJson(this);
  Map<String, dynamic> _$FilesToJson(ListFiles instance) => <String, dynamic>{
    'filenames': instance.filenames,
    'lastUsed': instance.lastUsed
  };

}