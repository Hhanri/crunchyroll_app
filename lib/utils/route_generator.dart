import 'package:crunchyroll_app/screens/anime_detail_page.dart';
import 'package:crunchyroll_app/screens/know_more_page.dart';
import 'package:crunchyroll_app/screens/select_season_page.dart';
import 'package:crunchyroll_app/screens/sign_in_page.dart';
import 'package:crunchyroll_app/screens/sign_up_page.dart';

import 'package:flutter/material.dart';
import '../main.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    final _arguments = settings.arguments;

    switch (settings.name) {
      case MAIN_APP : return MaterialPageRoute(builder: (_) => MyApp());
      case SIGN_IN_PAGE : return MaterialPageRoute(builder: (_) => SignInScreen());
      case SIGN_UP_PAGE : return MaterialPageRoute(builder: (_) => SignUpScreen());
      case ANIME_DETAIL_PAGE : return MaterialPageRoute(builder: (_) => AnimeDetailScreen(featuredAnimeArgument: _arguments));
      case KNOW_MORE_PAGE : return MaterialPageRoute(builder: (_) => KnowMoreScreen(featuredAnimeArgument: _arguments));
      case SELECT_SEASON_PAGE : return MaterialPageRoute(builder: (_) => SelectSeasonScreen(availableSeasonsArgument: _arguments));
      default : return MaterialPageRoute(builder: (_) => SignInScreen());
    }

  }

}
const String SIGN_IN_PAGE = "/SignIn";
const String SIGN_UP_PAGE = "/SignUp";
const String ANIME_DETAIL_PAGE = "/AnimeDetail";
const String KNOW_MORE_PAGE = "/KnowMore";
const String SELECT_SEASON_PAGE = "/SelectSeason";
const String MAIN_APP = "/";