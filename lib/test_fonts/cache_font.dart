// ignore_for_file: unused_field

import 'package:json_annotation/json_annotation.dart';
import 'package:typed_cache_json/typed_cache_json.dart';

part 'cache_font.g.dart';

class CacheBackend with JsonUtils {
  late JsonStore _cacheBackend;
  Future<T?> get<T extends CacheSealedClass>(String key) async {
    final data = await _cacheBackend.get(key, codec: CacheFontCodec());
    return data as T?;
  }

  Future<void> initialize() async {
    _cacheBackend = await createJsonCache(
      location: CacheLocation.support,
      fileName: 'fonts_cache.json',
      subdir: 'font_cache',
      enableRecovery: true,
    );
  }

  Future<void> save(CacheFont cacheFont) async {
    await _cacheBackend.put(cacheFont.key, cacheFont, codec: CacheFontCodec());
  }
}

class CacheBackendClassA with JsonUtils {
  late JsonStore _cacheBackend;
  Future<T?> get<T extends CacheSealedClass>(String key) async {
    final data = await _cacheBackend.get(key, codec: CacheFontCodec());
    return data as T?;
  }

  Future<void> initialize() async {
    _cacheBackend = await createJsonCache(
      location: CacheLocation.support,
      fileName: 'fonts_cache.json',
      subdir: 'font_cache',
      enableRecovery: true,
    );
  }

  Future<void> save(CacheSealedClassA cacheFont) async {
    await _cacheBackend.put(cacheFont.key, cacheFont, codec: CacheFontCodec());
  }
}

@JsonSerializable()
class CacheFont extends CacheSealedClass {
  CacheFont({required super.key, required this.fontName, required this.fontSize});
  factory CacheFont.fromJson(Map<String, Object?> json) => _$CacheFontFromJson(json);
  final String fontName;
  final int fontSize;

  @override
  String get dataType => "CacheFont";
  Map<String, Object?> toJson() => _$CacheFontToJson(this);
}

class CacheFontCodec extends JsonCacheCodec<CacheSealedClass> {
  @override
  String get typeId => "CacheSealedClassCodec:v1";

  @override
  CacheSealedClass decode(Map<String, Object?> json) {
    switch (json['dataType']) {
      case 'CacheFont':
        return CacheFont.fromJson(json);
      case 'CacheSealedClassA':
        return CacheSealedClassA.fromJson(json);
      default:
        throw UnimplementedError('Unknown dataType: ${json['dataType']}');
    }
  }

  @override
  Map<String, Object?> encode(CacheSealedClass value) {
    final Map<String, Object?> json = {};
    if (value is CacheFont) {
      json['dataType'] = value.dataType;
      json.addAll(value.toJson());
      return json;
    } else if (value is CacheSealedClassA) {
      json['dataType'] = value.dataType;
      json.addAll(value.toJson());
      return json;
    } else {
      throw UnimplementedError('Unknown CacheSealedClass type: ${value.runtimeType}');
    }
  }
}

sealed class CacheSealedClass {
  const CacheSealedClass({required this.key});
  final String key;

  String get dataType;
}

@JsonSerializable()
class CacheSealedClassA extends CacheSealedClass {
  const CacheSealedClassA({required super.key, required this.valueA});
  factory CacheSealedClassA.fromJson(Map<String, Object?> json) => _$CacheSealedClassAFromJson(json);
  final String valueA;
  @override
  String get dataType => "CacheSealedClassA";

  Map<String, Object?> toJson() => _$CacheSealedClassAToJson(this);
}
