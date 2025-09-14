// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:exemplos_flutter/declarative/declarative.router.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

/// generated route for
/// [_i1.AgeInputScreen]
class AgeInputRoute extends _i2.PageRouteInfo<AgeInputRouteArgs> {
  static const String name = 'AgeInputRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AgeInputRouteArgs>();
      return _i1.AgeInputScreen(
        key: args.key,
        onAgeSubmitted: args.onAgeSubmitted,
      );
    },
  );

  AgeInputRoute({
    _i3.Key? key,
    required _i3.ValueChanged<int> onAgeSubmitted,
    List<_i2.PageRouteInfo>? children,
  }) : super(
         AgeInputRoute.name,
         args: AgeInputRouteArgs(key: key, onAgeSubmitted: onAgeSubmitted),
         initialChildren: children,
       );
}

class AgeInputRouteArgs {
  final _i3.Key? key;

  final _i3.ValueChanged<int> onAgeSubmitted;

  const AgeInputRouteArgs({this.key, required this.onAgeSubmitted});

  @override
  int get hashCode => key.hashCode ^ onAgeSubmitted.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AgeInputRouteArgs) return false;
    return key == other.key && onAgeSubmitted == other.onAgeSubmitted;
  }

  @override
  String toString() {
    return 'AgeInputRouteArgs{key: $key, onAgeSubmitted: $onAgeSubmitted}';
  }
}

/// generated route for
/// [_i1.MainScreen]
class MainRoute extends _i2.PageRouteInfo<void> {
  static const String name = 'MainRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      return const _i1.MainScreen();
    },
  );

  const MainRoute({List<_i2.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);
}

/// generated route for
/// [_i1.NameInputScreen]
class NameInputRoute extends _i2.PageRouteInfo<NameInputRouteArgs> {
  static const String name = 'NameInputRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NameInputRouteArgs>();
      return _i1.NameInputScreen(
        key: args.key,
        onNameSubmitted: args.onNameSubmitted,
      );
    },
  );

  NameInputRoute({
    _i3.Key? key,
    required _i3.ValueChanged<String> onNameSubmitted,
    List<_i2.PageRouteInfo>? children,
  }) : super(
         NameInputRoute.name,
         args: NameInputRouteArgs(key: key, onNameSubmitted: onNameSubmitted),
         initialChildren: children,
       );
}

class NameInputRouteArgs {
  final _i3.Key? key;

  final _i3.ValueChanged<String> onNameSubmitted;

  const NameInputRouteArgs({this.key, required this.onNameSubmitted});

  @override
  int get hashCode => key.hashCode ^ onNameSubmitted.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NameInputRouteArgs) return false;
    return key == other.key && onNameSubmitted == other.onNameSubmitted;
  }

  @override
  String toString() {
    return 'NameInputRouteArgs{key: $key, onNameSubmitted: $onNameSubmitted}';
  }
}

/// generated route for
/// [_i1.ResultScreen]
class ResultRoute extends _i2.PageRouteInfo<ResultRouteArgs> {
  static const String name = 'ResultRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResultRouteArgs>();
      return _i1.ResultScreen(
        key: args.key,
        profile: args.profile,
        onReset: args.onReset,
      );
    },
  );

  ResultRoute({
    _i3.Key? key,
    required _i1.Profile profile,
    required _i3.VoidCallback onReset,
    List<_i2.PageRouteInfo>? children,
  }) : super(
         ResultRoute.name,
         args: ResultRouteArgs(key: key, profile: profile, onReset: onReset),
         initialChildren: children,
       );
}

class ResultRouteArgs {
  final _i3.Key? key;

  final _i1.Profile profile;

  final _i3.VoidCallback onReset;

  const ResultRouteArgs({
    this.key,
    required this.profile,
    required this.onReset,
  });

  @override
  int get hashCode => key.hashCode ^ profile.hashCode ^ onReset.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResultRouteArgs) return false;
    return key == other.key &&
        profile == other.profile &&
        onReset == other.onReset;
  }

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, profile: $profile, onReset: $onReset}';
  }
}
