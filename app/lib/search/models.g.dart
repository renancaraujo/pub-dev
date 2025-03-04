// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSnapshot _$SearchSnapshotFromJson(Map<String, dynamic> json) =>
    SearchSnapshot()
      ..updated = json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String)
      ..documents = (json['documents'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, PackageDocument.fromJson(e as Map<String, dynamic>)),
      );

Map<String, dynamic> _$SearchSnapshotToJson(SearchSnapshot instance) =>
    <String, dynamic>{
      'updated': instance.updated?.toIso8601String(),
      'documents': instance.documents,
    };

DartdocIndexEntry _$DartdocIndexEntryFromJson(Map<String, dynamic> json) =>
    DartdocIndexEntry(
      name: json['name'] as String?,
      qualifiedName: json['qualifiedName'] as String?,
      href: json['href'] as String?,
      kind: json['kind'] as int?,
      packageRank: json['packageRank'] as int?,
      overriddenDepth: json['overriddenDepth'] as int?,
      packageName: json['packageName'] as String?,
      desc: json['desc'] as String?,
      enclosedBy: json['enclosedBy'] == null
          ? null
          : DartdocIndexEntryEnclosedBy.fromJson(
              json['enclosedBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DartdocIndexEntryToJson(DartdocIndexEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('qualifiedName', instance.qualifiedName);
  writeNotNull('href', instance.href);
  writeNotNull('kind', instance.kind);
  writeNotNull('packageRank', instance.packageRank);
  writeNotNull('overriddenDepth', instance.overriddenDepth);
  writeNotNull('packageName', instance.packageName);
  writeNotNull('desc', instance.desc);
  writeNotNull('enclosedBy', instance.enclosedBy);
  return val;
}

DartdocIndexEntryEnclosedBy _$DartdocIndexEntryEnclosedByFromJson(
        Map<String, dynamic> json) =>
    DartdocIndexEntryEnclosedBy(
      name: json['name'] as String?,
      kind: json['kind'] as int?,
      href: json['href'] as String?,
    );

Map<String, dynamic> _$DartdocIndexEntryEnclosedByToJson(
    DartdocIndexEntryEnclosedBy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('kind', instance.kind);
  writeNotNull('href', instance.href);
  return val;
}
