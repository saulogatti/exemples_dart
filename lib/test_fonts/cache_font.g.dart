// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_font.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CacheFont _$CacheFontFromJson(Map<String, dynamic> json) => CacheFont(
  key: json['key'] as String,
  fontName: json['fontName'] as String,
  fontSize: (json['fontSize'] as num).toInt(),
);

Map<String, dynamic> _$CacheFontToJson(CacheFont instance) => <String, dynamic>{
  'key': instance.key,
  'fontName': instance.fontName,
  'fontSize': instance.fontSize,
};

CacheSealedClassA _$CacheSealedClassAFromJson(Map<String, dynamic> json) =>
    CacheSealedClassA(
      key: json['key'] as String,
      valueA: json['valueA'] as String,
    );

Map<String, dynamic> _$CacheSealedClassAToJson(CacheSealedClassA instance) =>
    <String, dynamic>{'key': instance.key, 'valueA': instance.valueA};
