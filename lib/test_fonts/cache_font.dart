// ignore_for_file: unused_field, flutter_style_todos

import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:typed_cache/typed_cache.dart' as tc;

part 'cache_font.g.dart';

tc.TypedCache<Uint8List, CacheSealedClassA> cacheBackend = tc.createTypedCache(
  backend: CacheBackendClassA(),
  defaultCodec: CacheFontCodec(),
);

class CacheBackendClassA implements tc.CacheBackend {
  final Map<String, tc.CacheEntry<Uint8List>> _storage = {};
  @override
  Future<void> clear() {
    _storage.clear();
    return Future.value();
  }

  @override
  Future<void> delete(String key) {
    _storage.remove(key);
    return Future.value();
  }

  @override
  Future<void> deleteTag(String tag) {
    // TODO: implement deleteTag
    throw UnimplementedError();
  }

  @override
  Future<Set<String>> keysByTag(String tag) {
    // TODO: implement keysByTag
    throw UnimplementedError();
  }

  @override
  Future<int> purgeExpired(int nowEpochMs) {
    // TODO: implement purgeExpired
    throw UnimplementedError();
  }

  @override
  Future<tc.CacheEntry<E>?> read<E>(String key) {
    return Future.value(_storage[key] as tc.CacheEntry<E>?);
  }

  @override
  Future<List<tc.CacheEntry<E>>> readAll<E>() {
    return Future.value(_storage.values.whereType<tc.CacheEntry<E>>().toList());
  }

  @override
  Future<void> write<E>(tc.CacheEntry<E> entry) {
    _storage[entry.key] = entry as tc.CacheEntry<Uint8List>;
    return Future.value();
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

class CacheFontCodec implements tc.CacheCodec<Uint8List, CacheSealedClassA> {
  @override
  String get typeId => "CacheSealedClassCodec:v1";

  @override
  CacheSealedClassA decode(Uint8List data) {
    final String jsonString = String.fromCharCodes(data);
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    // recupera o tipo de dado para desserialização correta
    final String dataType = jsonMap["dataType"] as String;
    switch (dataType) {
      case "CacheSealedClassA":
        return CacheSealedClassA.fromJson(jsonMap);
      default:
        throw Exception("Unknown data type: $dataType");
    }
  }

  @override
  Uint8List encode(CacheSealedClassA value) {
    final Map<String, Object?> jsonMap;
    switch (value.dataType) {
      case "CacheSealedClassA":
        jsonMap = value.toJson();
      default:
        throw Exception("Unknown data type: ${value.dataType}");
    }
    // Adiciona o tipo de dado ao mapa JSON
    jsonMap["dataType"] = value.dataType;
    final jsonString = jsonEncode(jsonMap);
    return Uint8List.fromList(utf8.encode(jsonString));
  }
}

sealed class CacheSealedClass {
  const CacheSealedClass({required this.key});
  final String key;

  /// Tipo do objeto armazenado no cache. Usado para desserialização.
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
