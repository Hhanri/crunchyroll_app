// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i11;

import '../models/content_model.dart' as _i12;
import '../screens/anime_detail_page.dart' as _i2;
import '../screens/home_page.dart' as _i3;
import '../screens/know_more_page.dart' as _i9;
import '../screens/select_season_page.dart' as _i10;
import '../screens/sign_in_page.dart' as _i7;
import '../screens/sign_up_page.dart' as _i8;
import '../screens/unknown_screen.dart' as _i4;
import '../screens/view_screen.dart' as _i1;
import '../widgets/browse_page_widgets.dart' as _i6;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<ViewRouteArgs>(orElse: () => const ViewRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.ViewScreen(key: args.key));
    },
    AnimeRouter.name: (routeData) {
      final args = routeData.argsAs<AnimeRouterArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.AnimeDetailScreen(
              key: args.key,
              featuredAnimeArgument: args.featuredAnimeArgument));
    },
    HomeRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeScreen());
    },
    MyListsRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.UnknownScreen());
    },
    BrowseRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    BrowseGenresRouteWidget.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.BrowseGenresScreenWidget());
    },
    BrowseAnimesRouteWidget.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<BrowseAnimesRouteWidgetArgs>(
          orElse: () => BrowseAnimesRouteWidgetArgs(
              searchedItem: pathParams.get('searchedItem')));
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.BrowseAnimesScreenWidget(
              key: args.key, searchedItem: args.searchedItem));
    },
    SignInRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SignInScreen());
    },
    SignUpRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SignUpScreen());
    },
    KnowMoreRoute.name: (routeData) {
      final args = routeData.argsAs<KnowMoreRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.KnowMoreScreen(
              key: args.key,
              featuredAnimeArgument: args.featuredAnimeArgument));
    },
    SelectSeasonRoute.name: (routeData) {
      final args = routeData.argsAs<SelectSeasonRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.SelectSeasonScreen(
              key: args.key,
              availableSeasons: args.availableSeasons,
              selectSeason: args.selectSeason,
              selectedSeason: args.selectedSeason));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(ViewRoute.name, path: '/', children: [
          _i5.RouteConfig(HomeRouter.name, path: 'home'),
          _i5.RouteConfig(MyListsRouter.name, path: 'MyLists'),
          _i5.RouteConfig(BrowseRouter.name, path: 'browse', children: [
            _i5.RouteConfig(BrowseGenresRouteWidget.name, path: ''),
            _i5.RouteConfig(BrowseAnimesRouteWidget.name, path: ':animes')
          ]),
          _i5.RouteConfig(SettingsRouter.name, path: 'settings', children: [
            _i5.RouteConfig(SignInRoute.name, path: ''),
            _i5.RouteConfig(SignUpRoute.name, path: 'signup')
          ])
        ]),
        _i5.RouteConfig(AnimeRouter.name, path: 'anime', children: [
          _i5.RouteConfig(KnowMoreRoute.name, path: 'knowmore'),
          _i5.RouteConfig(SelectSeasonRoute.name, path: 'selectseason')
        ])
      ];
}

/// generated route for [_i1.ViewScreen]
class ViewRoute extends _i5.PageRouteInfo<ViewRouteArgs> {
  ViewRoute({_i11.Key? key, List<_i5.PageRouteInfo>? children})
      : super(name,
            path: '/',
            args: ViewRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'ViewRoute';
}

class ViewRouteArgs {
  const ViewRouteArgs({this.key});

  final _i11.Key? key;
}

/// generated route for [_i2.AnimeDetailScreen]
class AnimeRouter extends _i5.PageRouteInfo<AnimeRouterArgs> {
  AnimeRouter(
      {_i11.Key? key,
      required dynamic featuredAnimeArgument,
      List<_i5.PageRouteInfo>? children})
      : super(name,
            path: 'anime',
            args: AnimeRouterArgs(
                key: key, featuredAnimeArgument: featuredAnimeArgument),
            initialChildren: children);

  static const String name = 'AnimeRouter';
}

class AnimeRouterArgs {
  const AnimeRouterArgs({this.key, required this.featuredAnimeArgument});

  final _i11.Key? key;

  final dynamic featuredAnimeArgument;
}

/// generated route for [_i3.HomeScreen]
class HomeRouter extends _i5.PageRouteInfo<void> {
  const HomeRouter() : super(name, path: 'home');

  static const String name = 'HomeRouter';
}

/// generated route for [_i4.UnknownScreen]
class MyListsRouter extends _i5.PageRouteInfo<void> {
  const MyListsRouter() : super(name, path: 'MyLists');

  static const String name = 'MyListsRouter';
}

/// generated route for [_i5.EmptyRouterPage]
class BrowseRouter extends _i5.PageRouteInfo<void> {
  const BrowseRouter({List<_i5.PageRouteInfo>? children})
      : super(name, path: 'browse', initialChildren: children);

  static const String name = 'BrowseRouter';
}

/// generated route for [_i5.EmptyRouterPage]
class SettingsRouter extends _i5.PageRouteInfo<void> {
  const SettingsRouter({List<_i5.PageRouteInfo>? children})
      : super(name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for [_i6.BrowseGenresScreenWidget]
class BrowseGenresRouteWidget extends _i5.PageRouteInfo<void> {
  const BrowseGenresRouteWidget() : super(name, path: '');

  static const String name = 'BrowseGenresRouteWidget';
}

/// generated route for [_i6.BrowseAnimesScreenWidget]
class BrowseAnimesRouteWidget
    extends _i5.PageRouteInfo<BrowseAnimesRouteWidgetArgs> {
  BrowseAnimesRouteWidget({_i11.Key? key, required dynamic searchedItem})
      : super(name,
            path: ':animes',
            args: BrowseAnimesRouteWidgetArgs(
                key: key, searchedItem: searchedItem),
            rawPathParams: {'searchedItem': searchedItem});

  static const String name = 'BrowseAnimesRouteWidget';
}

class BrowseAnimesRouteWidgetArgs {
  const BrowseAnimesRouteWidgetArgs({this.key, required this.searchedItem});

  final _i11.Key? key;

  final dynamic searchedItem;
}

/// generated route for [_i7.SignInScreen]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute() : super(name, path: '');

  static const String name = 'SignInRoute';
}

/// generated route for [_i8.SignUpScreen]
class SignUpRoute extends _i5.PageRouteInfo<void> {
  const SignUpRoute() : super(name, path: 'signup');

  static const String name = 'SignUpRoute';
}

/// generated route for [_i9.KnowMoreScreen]
class KnowMoreRoute extends _i5.PageRouteInfo<KnowMoreRouteArgs> {
  KnowMoreRoute({_i11.Key? key, required dynamic featuredAnimeArgument})
      : super(name,
            path: 'knowmore',
            args: KnowMoreRouteArgs(
                key: key, featuredAnimeArgument: featuredAnimeArgument));

  static const String name = 'KnowMoreRoute';
}

class KnowMoreRouteArgs {
  const KnowMoreRouteArgs({this.key, required this.featuredAnimeArgument});

  final _i11.Key? key;

  final dynamic featuredAnimeArgument;
}

/// generated route for [_i10.SelectSeasonScreen]
class SelectSeasonRoute extends _i5.PageRouteInfo<SelectSeasonRouteArgs> {
  SelectSeasonRoute(
      {_i11.Key? key,
      required List<_i12.AnimeSeason> availableSeasons,
      required dynamic Function(_i12.AnimeSeason) selectSeason,
      required _i12.AnimeSeason selectedSeason})
      : super(name,
            path: 'selectseason',
            args: SelectSeasonRouteArgs(
                key: key,
                availableSeasons: availableSeasons,
                selectSeason: selectSeason,
                selectedSeason: selectedSeason));

  static const String name = 'SelectSeasonRoute';
}

class SelectSeasonRouteArgs {
  const SelectSeasonRouteArgs(
      {this.key,
      required this.availableSeasons,
      required this.selectSeason,
      required this.selectedSeason});

  final _i11.Key? key;

  final List<_i12.AnimeSeason> availableSeasons;

  final dynamic Function(_i12.AnimeSeason) selectSeason;

  final _i12.AnimeSeason selectedSeason;
}
