import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crunchyroll_app/controller/view_screen_controller.dart';
import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/providers/firestore_provider.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/screens/home_page.dart';
import 'package:crunchyroll_app/screens/search_page.dart';
import 'package:crunchyroll_app/screens/sign_in_page.dart';
import 'package:crunchyroll_app/screens/unknown_screen.dart';
import 'package:crunchyroll_app/screens/browse_page.dart';
import 'package:crunchyroll_app/utils/navigation_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:provider/provider.dart';


class ViewScreen extends StatelessWidget {
  ViewScreen({
    Key? key,
  }) : super(key: key);

  final List<String> appBarTitles = [
    Strings.home,
    Strings.myLists,
    Strings.browse,
    Strings.settings
  ];

  final List<BottomNavigationBarItem> bottomNavBarItems = const[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined
      ),
      label: Strings.home
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.bookmark_border_outlined
      ),
      label: Strings.myLists
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.border_all_outlined
      ),
      label: Strings.browse
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle_rounded
      ),
      label: Strings.settings
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (BuildContext initFirebaseContext, AsyncSnapshot<dynamic> snapshot) {
        return MultiProvider(
          providers: [
            StreamProvider<List<AnimeContent>>.value(value: FirebaseProvider.getAnimesStream, initialData: [],)
          ],
          child: GetBuilder<ViewScreenController>(
            builder: (controller) {
              if (snapshot.hasError) {
                NavigationUtils.showMyDialog(context: initFirebaseContext, bodyText: Strings.errorFirebaseInit);
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return ViewScreenScaffoldWidget(
                  appBarTitles: appBarTitles,
                  bottomNavBarItems: bottomNavBarItems,
                  controller: controller,
                );
              }
              return const CircularProgressIndicator();
            }
          )
        );
      }
    );
  }
}

class ViewScreenScaffoldWidget extends StatelessWidget {
  final List<String> appBarTitles;
  final List<BottomNavigationBarItem> bottomNavBarItems;
  final ViewScreenController controller;

  const ViewScreenScaffoldWidget({
    Key? key,
    required this.appBarTitles,
    required this.bottomNavBarItems,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DataProvider.animes = FirebaseProvider.animeListProvider(context);
    DataProvider.homePlaylists = [
      HomeList(
          listTitle: "Trending",
          animes: [
            DataProvider.animes.singleWhere((element) => element.title == Strings.kimetsuNoYaibaTitle),
            DataProvider.animes.singleWhere((element) => element.title == Strings.narutoTitle),
            DataProvider.animes.singleWhere((element) => element.title == Strings.quintessentialQuintupletsTitle),
            DataProvider.animes.singleWhere((element) => element.title == Strings.karakaiJouzuNoTakagisanTitle),
          ]
      ),
      HomeList(
          listTitle: "Recently Added",
          animes: [
            DataProvider.animes.singleWhere((element) => element.title == Strings.narutoTitle),
            DataProvider.animes.singleWhere((element) => element.title == Strings.quintessentialQuintupletsTitle),
            DataProvider.animes.singleWhere((element) => element.title == Strings.kimetsuNoYaibaTitle),
            DataProvider.animes.singleWhere((element) => element.title == Strings.karakaiJouzuNoTakagisanTitle),
          ]
      ),
      HomeList(
          listTitle: "Most seen",
          animes: [
            DataProvider.animes.singleWhere((element) => element.title == Strings.karakaiJouzuNoTakagisanTitle),
            DataProvider.animes.singleWhere((element) => element.title == Strings.kimetsuNoYaibaTitle),
          ]
      ),
    ];
    DataProvider.trendingAnime = DataProvider.animes.singleWhere((element) => element.title == Strings.karakaiJouzuNoTakagisanTitle);

    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            appBarTitles[controller.tabIndex]
          )
        ),
        actions: const [
          SearchButtonWidget()
        ],
      ),
      body: IndexedStack(
        children: [HomeScreen(homePlaylist: DataProvider.homePlaylists),
          const UnknownScreen(),
          const BrowseGenresScreen(),
          const SignInScreen()],
        index: controller.tabIndex,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        bottomNavBarItems: bottomNavBarItems,
        controller: controller,
      )
    );
  }
}

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showSearch(context: context, delegate: AnimeSearch() );
      },
      child: const Icon(
        Icons.search_outlined
      )
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  final ViewScreenController controller;
  final List<BottomNavigationBarItem> bottomNavBarItems;
  const BottomNavigationBarWidget({
    Key? key,
    required this.bottomNavBarItems,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: controller.changeTabIndex,
      currentIndex: controller.tabIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.containerColor,
      selectedItemColor: MyColors.primaryColor,
      unselectedItemColor: Colors.white.withOpacity(0.8),
      items: bottomNavBarItems
    );
  }
}
