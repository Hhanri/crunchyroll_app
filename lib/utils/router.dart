import 'package:auto_route/auto_route.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/screens/anime_detail_page.dart';
import 'package:crunchyroll_app/screens/home_page.dart';
import 'package:crunchyroll_app/screens/know_more_page.dart';
import 'package:crunchyroll_app/screens/select_season_page.dart';
import 'package:crunchyroll_app/screens/sign_in_page.dart';
import 'package:crunchyroll_app/screens/sign_up_page.dart';
import 'package:crunchyroll_app/screens/unknown_screen.dart';
import 'package:crunchyroll_app/screens/view_screen.dart';
import 'package:crunchyroll_app/widgets/browse_page_widgets.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes:[
    AutoRoute(
      path: "/",
      page: ViewScreen,
      children: [
        AutoRoute(
          path: "home",
          name: "HomeRouter",
          page: HomeScreen,
        ),
        AutoRoute(
          path: "MyLists",
          name: "MyListsRouter",
          page: UnknownScreen,
        ),
        AutoRoute(
          path: "browse",
          name: "BrowseRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: "",
              page: BrowseGenresScreenWidget
            ),
            AutoRoute(
              path: ":animes",
              page: BrowseAnimesScreenWidget,
            )
          ]
        ),
        AutoRoute(
          path: "settings",
          name: "SettingsRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: "",
              page: SignInScreen,
            ),
            AutoRoute(
              path: "signup",
              page: SignUpScreen
            )
          ]
        )
      ]
    ),
    AutoRoute(
      path: "anime",
      name: "AnimeRouter",
      page: AnimeDetailScreen,
      children: [
        AutoRoute(
          path: "knowmore",
          page: KnowMoreScreen
        ),
        AutoRoute(
          path: "selectseason",
          page: SelectSeasonScreen
        )
      ]
    )
  ]
)
class $AppRouter{}