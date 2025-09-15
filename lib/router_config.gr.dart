// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:exemplos_flutter/my_home_page.dart' as _i8;
import 'package:exemplos_flutter/rotas/declarative/declarative.router.dart'
    as _i1;
import 'package:exemplos_flutter/rotas/mobile/screens/books/book_details_page.dart'
    as _i2;
import 'package:exemplos_flutter/rotas/mobile/screens/books/book_list_page.dart'
    as _i3;
import 'package:exemplos_flutter/rotas/mobile/screens/home_page.dart' as _i5;
import 'package:exemplos_flutter/rotas/mobile/screens/login_page.dart' as _i6;
import 'package:exemplos_flutter/rotas/mobile/screens/profile/my_books_page.dart'
    as _i7;
import 'package:exemplos_flutter/rotas/mobile/screens/profile/profile_page.dart'
    as _i9;
import 'package:exemplos_flutter/rotas/mobile/screens/settings_page.dart'
    as _i10;
import 'package:exemplos_flutter/routes_simples/routes_simples.dart' as _i4;
import 'package:flutter/material.dart' as _i12;

/// generated route for
/// [_i1.AgeInputScreen]
class AgeInputRoute extends _i11.PageRouteInfo<AgeInputRouteArgs> {
  AgeInputRoute({
    required _i12.ValueChanged<int> onAgeSubmitted,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         AgeInputRoute.name,
         args: AgeInputRouteArgs(onAgeSubmitted: onAgeSubmitted, key: key),
         initialChildren: children,
       );

  static const String name = 'AgeInputRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AgeInputRouteArgs>();
      return _i1.AgeInputScreen(
        onAgeSubmitted: args.onAgeSubmitted,
        key: args.key,
      );
    },
  );
}

class AgeInputRouteArgs {
  const AgeInputRouteArgs({required this.onAgeSubmitted, this.key});

  final _i12.ValueChanged<int> onAgeSubmitted;

  final _i12.Key? key;

  @override
  String toString() {
    return 'AgeInputRouteArgs{onAgeSubmitted: $onAgeSubmitted, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AgeInputRouteArgs) return false;
    return onAgeSubmitted == other.onAgeSubmitted && key == other.key;
  }

  @override
  int get hashCode => onAgeSubmitted.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i2.BookDetailsPage]
class BookDetailsRoute extends _i11.PageRouteInfo<BookDetailsRouteArgs> {
  BookDetailsRoute({
    _i12.Key? key,
    int id = -1,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         BookDetailsRoute.name,
         args: BookDetailsRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'BookDetailsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<BookDetailsRouteArgs>(
        orElse: () => BookDetailsRouteArgs(id: pathParams.getInt('id', -1)),
      );
      return _i2.BookDetailsPage(key: args.key, id: args.id);
    },
  );
}

class BookDetailsRouteArgs {
  const BookDetailsRouteArgs({this.key, this.id = -1});

  final _i12.Key? key;

  final int id;

  @override
  String toString() {
    return 'BookDetailsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookDetailsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i3.BookListScreen]
class BookListRoute extends _i11.PageRouteInfo<void> {
  const BookListRoute({List<_i11.PageRouteInfo>? children})
    : super(BookListRoute.name, initialChildren: children);

  static const String name = 'BookListRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.BookListScreen();
    },
  );
}

/// generated route for
/// [_i4.FirstScreen]
class FirstRoute extends _i11.PageRouteInfo<void> {
  const FirstRoute({List<_i11.PageRouteInfo>? children})
    : super(FirstRoute.name, initialChildren: children);

  static const String name = 'FirstRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.FirstScreen();
    },
  );
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomePage();
    },
  );
}

/// generated route for
/// [_i4.HostScreen]
class HostRoute extends _i11.PageRouteInfo<void> {
  const HostRoute({List<_i11.PageRouteInfo>? children})
    : super(HostRoute.name, initialChildren: children);

  static const String name = 'HostRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.HostScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i12.Key? key,
    bool showBackButton = true,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, showBackButton: showBackButton),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i6.LoginPage(key: args.key, showBackButton: args.showBackButton);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.showBackButton = true});

  final _i12.Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, showBackButton: $showBackButton}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key && showBackButton == other.showBackButton;
  }

  @override
  int get hashCode => key.hashCode ^ showBackButton.hashCode;
}

/// generated route for
/// [_i1.MainScreen]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.MainScreen();
    },
  );
}

/// generated route for
/// [_i7.MyBooksPage]
class MyBooksRoute extends _i11.PageRouteInfo<MyBooksRouteArgs> {
  MyBooksRoute({
    _i12.Key? key,
    String? filter = 'none2',
    List<_i11.PageRouteInfo>? children,
  }) : super(
         MyBooksRoute.name,
         args: MyBooksRouteArgs(key: key, filter: filter),
         rawQueryParams: {'filter': filter},
         initialChildren: children,
       );

  static const String name = 'MyBooksRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<MyBooksRouteArgs>(
        orElse: () =>
            MyBooksRouteArgs(filter: queryParams.optString('filter', 'none2')),
      );
      return _i7.MyBooksPage(key: args.key, filter: args.filter);
    },
  );
}

class MyBooksRouteArgs {
  const MyBooksRouteArgs({this.key, this.filter = 'none2'});

  final _i12.Key? key;

  final String? filter;

  @override
  String toString() {
    return 'MyBooksRouteArgs{key: $key, filter: $filter}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MyBooksRouteArgs) return false;
    return key == other.key && filter == other.filter;
  }

  @override
  int get hashCode => key.hashCode ^ filter.hashCode;
}

/// generated route for
/// [_i8.MyHomePage]
class MyHomeRoute extends _i11.PageRouteInfo<void> {
  const MyHomeRoute({List<_i11.PageRouteInfo>? children})
    : super(MyHomeRoute.name, initialChildren: children);

  static const String name = 'MyHomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.MyHomePage();
    },
  );
}

/// generated route for
/// [_i1.NameInputScreen]
class NameInputRoute extends _i11.PageRouteInfo<NameInputRouteArgs> {
  NameInputRoute({
    required _i12.ValueChanged<String> onNameSubmitted,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         NameInputRoute.name,
         args: NameInputRouteArgs(onNameSubmitted: onNameSubmitted, key: key),
         initialChildren: children,
       );

  static const String name = 'NameInputRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NameInputRouteArgs>();
      return _i1.NameInputScreen(
        onNameSubmitted: args.onNameSubmitted,
        key: args.key,
      );
    },
  );
}

class NameInputRouteArgs {
  const NameInputRouteArgs({required this.onNameSubmitted, this.key});

  final _i12.ValueChanged<String> onNameSubmitted;

  final _i12.Key? key;

  @override
  String toString() {
    return 'NameInputRouteArgs{onNameSubmitted: $onNameSubmitted, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NameInputRouteArgs) return false;
    return onNameSubmitted == other.onNameSubmitted && key == other.key;
  }

  @override
  int get hashCode => onNameSubmitted.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfilePage();
    },
  );
}

/// generated route for
/// [_i1.ResultScreen]
class ResultRoute extends _i11.PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    required _i1.Profile profile,
    required _i12.VoidCallback onReset,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         ResultRoute.name,
         args: ResultRouteArgs(profile: profile, onReset: onReset, key: key),
         initialChildren: children,
       );

  static const String name = 'ResultRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResultRouteArgs>();
      return _i1.ResultScreen(
        profile: args.profile,
        onReset: args.onReset,
        key: args.key,
      );
    },
  );
}

class ResultRouteArgs {
  const ResultRouteArgs({
    required this.profile,
    required this.onReset,
    this.key,
  });

  final _i1.Profile profile;

  final _i12.VoidCallback onReset;

  final _i12.Key? key;

  @override
  String toString() {
    return 'ResultRouteArgs{profile: $profile, onReset: $onReset, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResultRouteArgs) return false;
    return profile == other.profile &&
        onReset == other.onReset &&
        key == other.key;
  }

  @override
  int get hashCode => profile.hashCode ^ onReset.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i4.SecondScreen]
class SecondRoute extends _i11.PageRouteInfo<void> {
  const SecondRoute({List<_i11.PageRouteInfo>? children})
    : super(SecondRoute.name, initialChildren: children);

  static const String name = 'SecondRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.SecondScreen();
    },
  );
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsTab extends _i11.PageRouteInfo<SettingsTabArgs> {
  SettingsTab({
    _i12.Key? key,
    String tab = 'none',
    String query = 'none',
    List<_i11.PageRouteInfo>? children,
  }) : super(
         SettingsTab.name,
         args: SettingsTabArgs(key: key, tab: tab, query: query),
         rawPathParams: {'tab': tab},
         rawQueryParams: {'query': query},
         initialChildren: children,
       );

  static const String name = 'SettingsTab';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<SettingsTabArgs>(
        orElse: () => SettingsTabArgs(
          tab: pathParams.getString('tab', 'none'),
          query: queryParams.getString('query', 'none'),
        ),
      );
      return _i10.SettingsPage(key: args.key, tab: args.tab, query: args.query);
    },
  );
}

class SettingsTabArgs {
  const SettingsTabArgs({this.key, this.tab = 'none', this.query = 'none'});

  final _i12.Key? key;

  final String tab;

  final String query;

  @override
  String toString() {
    return 'SettingsTabArgs{key: $key, tab: $tab, query: $query}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SettingsTabArgs) return false;
    return key == other.key && tab == other.tab && query == other.query;
  }

  @override
  int get hashCode => key.hashCode ^ tab.hashCode ^ query.hashCode;
}

/// generated route for
/// [_i5.WelcomeScreen]
class WelcomeRoute extends _i11.PageRouteInfo<void> {
  const WelcomeRoute({List<_i11.PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.WelcomeScreen();
    },
  );
}
